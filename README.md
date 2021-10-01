# AES-using-VHDL
Advanced Encryption Standard(AES) Algorithm is implementd using VHDL.
This algoritm is also known as Rijendael algorithm becuase it is developed by Rijendael.
AES is capable of encrypting 128, 192 and 256 bits of data and results an Cipher text of same size as input. Depending on the size of input plain text the number of rounds in the algorithm changes. It has 10, 12 and 14 rounds for 128, 192 and 256-bit input plain text respectively.
Along with the input plain text it also has a input key of 128 bits. Each round of AES algorithm has 4 steps substitution of bytes, shift-Rows, Mix-Columns and Addition of Round key. Before these rounds there is a pre-round has only one step is Additon if round key this output is passed for further rounds "Round-1..".

# Substitution of bytes
Substitution of bytes is the replacing a each byte of data with a pre-defined byte. This substitution is done using Rijendael S-box()encryption.

# Shift Rows
It is one of the easiest step in the round. 
In the  shift-row operation there is no change in 1st row, 2nd row is left-shifted by 1 byte, 3rd row is left-shifted by 2 bytes and the last row is shifted by 3 bytes.

# Mix Columns
For the process of mix-column is the multiplication of the input matrix with a pre-defined matrix.
The step multiplication of matrices involves addition and multiplication of the numbers. These addition and multiplication are done using Galio’s-field addition and multiplication.

# Addition of Round-key
This is the last step in the Round. It takes two inputs input text and the key respective to the round. 
The addition of round key is the XOR operation of round key and the input data. 

# Key Expansion
For each round in AES requires different key for the addition to the input text. So, the given input key is used to generate key for its next round.
The given input key is divided into blocks and the 4th word(1 word = 32 bits) of the key is passed into G-Function and the output is XOR-ed with 1st word of input key to generate the 1st word of required key, this 1st word of the required key is XOR-ed with the 2nd word of the input key that gives the 2nd word of the required key, this 2nd word of the required key is XOR-ed with the 2nd word of the input key that gives the 3rd word of the required key and for the 4th word is done similarly.
And the keys of all the rounds are produced using the previous round key.
![image](https://user-images.githubusercontent.com/91657743/135605840-42516e95-834f-4c08-a257-e58083b40716.png)
