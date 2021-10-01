# AES-using-VHDL
Advanced Encryption Standard(AES) Algorithm is implementd using VHDL.
This algoritm is also known as Rijendael algorithm becuase it is developed by Rijendael.
AES is capable of encrypting 128, 192 and 256 bits of data and results an Cipher text of same size as input. Depending on the size of input plain text the number of rounds in the algorithm changes. It has 10, 12 and 14 rounds for 128, 192 and 256-bit input plain text respectively.
Along with the input plain text it also has a input key of 128 bits. Each round of AES algorithm has 4 steps substitution of bytes, shift-Rows, Mix-Columns and Addition of Round key. Before these rounds there is a pre-round has only one step is Additon if round key this output is passed for further rounds "Round-1..".
Substitution of bytes is the replacing a each byte of data with a pre-defined byte. This substitution is done using Rijendael S-box()encryption.
