OTPNAME=$1

ProcessImage() {
    OUTPUT=`zbarimg download.png`
    echo $OUTPUT | sed 's/^QR-Code://' | pbcopy
}

ProcessImage
echo "Image has been processed, and URI string captured, just hit ctrl + V when prompted for URI"

pass otp add $OTPNAME
echo "Script complete, test it out with type pass otp $OTPNAME"
exit 0


