#  < { chmod u+w /dev/fd/3 ; bash personal/jschein/pq/example.bash > /dev/fd/3 || less <&3 3<&-; } 3<<< ignored
tf="/tmp/tempfile"
unbuffer -p bash personal/jschein/pq/example.bash > $tf || less < $tf; rm -f $tf

# unbuffer -p 
# echo "hello"