registers_two_bit = {
    "r0": "00",
    "r1": "01",
    "r2": "10",
    "r3": "11"
}

immediate_5_bit = {
    '#0': '00000',
    '#1': '00001',
    '#2': '00010',
    '#3': '00011',
    '#4': '00100',
    '#5': '00101',
    '#6': '00110',
    '#7': '00111',
    '#8': '01000',
    '#9': '01001',
    '#10': '01010',
    '#11': '01011',
    '#12': '01100',
    '#13': '01101',
    '#14': '01110',
    '#15': '01111',
    '#16': '10000',
    '#17': '10001',
    '#18': '10010',
    '#19': '10011',
    '#20': '10100',
    '#21': '10101',
    '#22': '10110',
    '#23': '10111',
    '#24': '11000',
    '#25': '11001',
    '#26': '11010',
    '#27': '11011',
    '#28': '11100',
    '#29': '11101',
    '#30': '11110',
    '#31': '11111'
}

immediate_4_bit = {
    '#0': '0000',
    '#1': '0001',
    '#2': '0010',
    '#3': '0011',
    '#4': '0100',
    '#5': '0101',
    '#6': '0110',
    '#7': '0111',
    '#8': '1000',
    '#9': '1001',
    '#10': '1010',
    '#11': '1011',
    '#12': '1100',
    '#13': '1101',
    '#14': '1110',
    '#15': '1111'
}

lw = '0000'
lwl = '0001'
sw = '0010'
swl = '0011'
xor = '0100'
add = '0101'
lsr = '0110'
lsl = '0111'
mov = '1000'
sne = '1001'
seq = '1010'
boo = '1011'
lut = '1100'
bol = '1101'
msk = '1110'

with (
    open("assembly.txt", "r") as a,
    open("machine.txt", "w") as b
):
    line = a.readline()
    while(line):
        inst = line.split()
        writeline = ''

        # switch to handle each instruction
        if inst[0] == 'lw':
            writeline += lw
        elif inst[0] == 'lwl':
            writeline += lwl
        elif inst[0] == 'sw':
            writeline += sw
        elif inst[0] == 'swl':
            writeline += swl
        elif inst[0] == 'xor':
            writeline += xor
        elif inst[0] == 'add':
            writeline += add
        elif inst[0] == 'lsr':
            writeline += lsr
        elif inst[0] == 'lsl':
            writeline += lsl
        elif inst[0] == 'mov':
            writeline += mov
        elif inst[0] == 'sne':
            writeline += sne
        elif inst[0] == 'seq':
            writeline += seq
        elif inst[0] == 'boo':
            writeline += boo
        elif inst[0] == 'lut':
            writeline += lut
        elif inst[0] == 'bol':
            writeline += bol
        elif inst[0] == 'msk':
            writeline += msk

        if (inst[0] == 'sne') or (inst[0] == 'seq'):
            writeline += immediate_5_bit[inst[1]]
        elif (inst[0] == 'boo') or (inst[0] == 'bol'):
            writeline += immediate_4_bit[inst[1]]
        else:
            writeline += registers_two_bit[inst[1]]

        writeline += op_add
        writeline += '\n'
        b.write(writeline)
        line = a.readline()