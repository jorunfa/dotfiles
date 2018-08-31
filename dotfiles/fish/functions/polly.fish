function polly
    set pollyfile (random)".mp3"
    aws polly synthesize-speech --output-format mp3 --voice-id Joanna --text "$argv" $pollyfile > /dev/null
    and afplay $pollyfile
    rm "$pollyfile"
end
