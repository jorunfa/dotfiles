function sr --description "Search and replace, e.g.: sr 'the-old' 'the-new' [directory]"
	set argv_count (count $argv)

	if test $argv_count -lt 2
		echo "Too few arguments"
		return 1
	end

	if test $argv[3]
        set dir $argv[3]
    else
        set dir (pwd)
    end

	sd $argv[1] $argv[2] (fd . $dir --type file)
end
