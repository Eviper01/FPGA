addresses = ["100000000","100000001","000000000","000000001","000000010","000000011","000000100","000000101","000000110","000000111","000001000","000001001","000001010","000001011","000001100","000001101","000001110"]
bytes = ["00000001","00000110","00010000","10000000","00010000","10000001","00010001","10000110","11001001","10000011","11001001","10000000","11001001","10000011","11001001","10000001","10000010"]
template0 = "wait for 1 ns;\nclk<='0';\ndebug_interface_addr<=" + '"'
template1 = '";\ndebug_interface_data<="'
template2 = '";\nwait for 1 ns;\nclk<=' + "'1';\n"
parts = []
for i in range(len(addresses)):
    addr = addresses[i]
    byte = bytes[i]
    part = template0 + addr + template1 + byte + template2
    parts.append(part)
with open('out.bin', 'w') as f:
    for item in parts:
        f.write("%s\n" % item)
print("Compiled to out.bin")
