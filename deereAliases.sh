#John Deere Stuff
alias dataloader="C:/bench/HDP/HDP/bin/x64/Debug/JohnDeere.HDP.DataLoader.exe -new_console"
alias getkeys="python /c/bench/ads-infrastructure/credentials/get_temp_keys.py"
alias rv="rake verify"
alias mci="mvn clean install"
alias tree="mvn dependency:tree > deps.txt"
alias avro="java -jar /c/bench/tools/avro/avro-tools-1.8.2.jar"
alias kspy="C:/bench/KinesisSpy/bin/Debug/KinesisSpy.exe &"
alias kmsdecrypt="'kmsDecryption'"
alias jq="c:/bench/tools/jq/jq.exe"
alias qretry="'moveErrorQueuesBackToMain'"
alias qclear="'clearOutErrorQueues'"
alias qprint="'printOutErrorQueues'"

function kmsDecryption() {
    kmsFile="kms_encrypted_binary.tmp"
    winTempDir=`cygpath -d $TEMP`
    base64 --decode $1 > $TEMP/$kmsFile
    aws kms decrypt --region us-east-1 --ciphertext-blob fileb://$winTempDir/$kmsFile --output text --query Plaintext | base64 --decode --ignore-garbage
    rm $TEMP/$kmsFile
}

function printOutErrorQueues(){
    curDir=$PWD
    cd /c/bench
    env=$2
    queueName=$(getHdpStreamName $3 $1)
    echo "$queueName.ERROR:"
    prettyPrintQueue "Primary" $env $queueName
    prettyPrintQueue "Backup" $env $queueName

    cd $curDir
}

function prettyPrintQueue(){
    tempFile="$tmp/qprettytempfile.txt"
    echo "$1"
    ./queue-utility/printq.bat $2 $1 "$3.ERROR" > $tempFile
    sed -i -e 's/></>\n</g' $tempFile

    while read p; do
        if [[ $p == "<"* ]];
        then
            echo $p
        elif [[ $p != "P"* ]] && [[ $p != "\n"* ]];
        then
            echo ""
            echo $p
        fi
    done < $tempFile

    rm -rf $tempFile
}

function clearOutErrorQueues(){
    curDir=$PWD
    cd /c/bench
    env=$2
    queueName=$(getHdpStreamName $3 $1)
    ./queue-utility/clearq.bat $env "$queueName.ERROR"
    cd $curDir
}

function moveErrorQueuesBackToMain(){
    curDir=$PWD
    cd /c/bench
    env=$2
    queueName=$(getHdpStreamName $3 $1)
    ./queue-utility/moveq.bat $env primary primary "$queueName.ERROR" $queueName
    ./queue-utility/moveq.bat $env backup primary "$queueName.ERROR" $queueName
    cd $curDir
}

function getHdpStreamName(){
    region=${2,,}
    queueName=${1,,}
    actualName=""
    streamRegion=""

    if [ $region == "eu" ]
    then
        streamRegion=".R2"
    fi

    case "$queueName" in
        "fileprocess")
            actualName="ISG.AXIOM$streamRegion.HDPCOMM.PROCESSFILE.REQUEST"
            ;;
        "logoperationupdate")
            actualName="ISG.AXIOM$streamRegion.HDPCOMM.LOGOPERATION.REQUEST"
            ;;
        "groupprocessing")
            actualName="ISG.HDP$streamRegion.GROUPING.REQUEST"
            ;;
        "aggregation")
            actualName="ISG.HDP$streamRegion.AGGREGATION.REQUEST"
            ;;
        "mapgenerator")
            actualName="ISG.HDP$streamRegion.GENERATEMAPS.REQUEST"
            ;;
        "polygongenerator")
            actualName="ISG.HDP$streamRegion.GENERATEPOLYGONS.REQUEST"
            ;;
        "apexmigrator")
            actualName="ISG.AXIOM$streamRegion.HDPCOMM.PROCESSBACKUP.REQUEST"
            ;;
        *)
            ;;
    esac

    echo $actualName
}
