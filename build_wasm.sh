
echo 'int printf(const char *, ...); int main(){printf("hello world!\\n");}' |  wasmtime  --dir=. clang.wasm -cc1 -triple wasm32-unknown-wasi -isysroot ./sysroot -internal-isystem ./sysroot/include -emit-obj -o ./example.o -
wasmtime --dir=. --dir=./sysroot/lib wasm-ld.wasm -L./sysroot/lib/wasm32-wasi ./sysroot/lib/wasm32-wasi/crt1.o ./example.o -lc -o ./example.wasm
