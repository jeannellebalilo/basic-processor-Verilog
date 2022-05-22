registers_two_bit = {
    "r0": "00",
    "r0,": "00",
    "r1": "01",
    "r1,": "01",
    "r2": "10",
    "r2,": "10",
    "r3": "11",
    "r3,": "11"
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

immediate_3_bit = {
    '#0': '000',
    '#1': '001',
    '#2': '010',
    '#3': '011',
    '#4': '100',
    '#5': '101',
    '#6': '110',
    '#7': '111'
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
    open("machinecode.txt", "w") as b
):
    line = a.readline()
    while(line):
        inst = line.split()
        writeline = ''

        # ignore blank lines
        if not inst:
            line = a.readline()
            continue

        # Flags:
        # i - help us ignore comments
        # i5 - instructions that need 5 bit immediates
        # i4 - instructions that need 4 bit immediates
        # i3 - instructions that need 3 bit immediates
        # reg1 - inst[1] is a register
        # reg2 - inst[2] is a register
        # mod - need to add modify bit
        i = 0
        i5 = 0
        i4 = 0
        i3 = 0
        reg1 = 0
        reg2 = 0
        mod = 0

        # OPCODES
        if inst[0] == 'lw':
            writeline += lw
            i = 1
            reg1 = 1
            reg2 = 1
            mod = 1
        elif inst[0] == 'lwl':
            writeline += lwl
            i = 1
            reg1 = 1
            i3 = 1
        elif inst[0] == 'sw':
            writeline += sw
            i = 1
            reg1 = 1
            reg2 = 1
            mod = 1
        elif inst[0] == 'swl':
            writeline += swl
            i = 1
            reg1 = 1
            i3 = 1
        elif inst[0] == 'xor':
            writeline += xor
            i = 1
            reg1 = 1
            reg2 = 1
            mod = 1
        elif inst[0] == 'add':
            writeline += add
            i = 1
            reg1 = 1
            i3 = 1
        elif inst[0] == 'lsr':
            writeline += lsr
            i = 1
            reg1 = 1
            i3 = 1
        elif inst[0] == 'lsl':
            writeline += lsl
            i = 1
            reg1 = 1
            i3 = 1
        elif inst[0] == 'mov':
            writeline += mov
            i = 1
            reg1 = 1
            reg2 = 1
            mod = 1
        elif inst[0] == 'sne':
            writeline += sne
            i = 1
            i5 = 1
        elif inst[0] == 'seq':
            writeline += seq
            i = 1
            i5 = 1
        elif inst[0] == 'boo':
            writeline += boo
            i = 1
            i4 = 1
            mod = 1
        elif inst[0] == 'lut':
            writeline += lut
            i = 1
            reg1 = 1
            reg2 = 1
            mod = 1
        elif inst[0] == 'bol':
            writeline += bol
            i = 1
            i4 = 1
            mod = 1
        elif inst[0] == 'msk':
            writeline += msk
            i = 1
            reg1 = 1
            i3 = 1

        # Handle first immediate / register
        if i5:
            writeline += immediate_5_bit[inst[1]]
        elif i4:
            writeline += immediate_4_bit[inst[1]]
        elif reg1:
            writeline += registers_two_bit[inst[1]]


        # Handle second immediate / register
        if reg2:
            writeline += registers_two_bit[inst[2]]
        elif i3:
            writeline += immediate_3_bit[inst[2]]

        # Handle modify bit - how do we know what bit it's supposed to be, though?
        if mod:
            writeline += '0'

        if (i == 1):
            writeline += '\n'
            b.write(writeline)
        line = a.readline()