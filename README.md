# protobuf-crash

Crash test for Protobuf PHP extension version 3.5.1

## Usage

Run `make` and you should get the following crash output:

```
... copious build log ...
docker run --privileged -v /Users/jbq/Work/Baiya/crash:/app crash sh -c 'cd /app && echo run -d extension=protobuf.so src/CrashCommand.php > debug && echo bt >> debug && gdb php -batch -x debug'
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
bool(false)

Program received signal SIGSEGV, Segmentation fault.
0x0000555555a59167 in zend_hash_find ()
#0  0x0000555555a59167 in zend_hash_find ()
#1  0x0000555555944cf7 in zif_array_key_exists ()
#2  0x0000555555aefa0c in execute_ex ()
#3  0x0000555555af5624 in zend_execute ()
#4  0x0000555555a44c73 in zend_execute_scripts ()
#5  0x00005555559e0258 in php_execute_script ()
#6  0x0000555555af799f in do_cli ()
#7  0x00005555556a88c9 in main ()
```
