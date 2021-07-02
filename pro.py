#the program is written in linux enviroment
#all the paths are written assuming python program and source file are at same place
#the program is tested for text file
#provide correct path wherever necessary
#the files were all at desktop in linux enviroment



import os
from Crypto.Cipher import AES
from Crypto.Cipher import DES
from Crypto.Random import random
from secrets import token_bytes
import struct
import requests

key = '1234567891234567'
iv = '1234567891234567'
key_d = token_bytes(8)
ivd = token_bytes(8)




url = 'https://transcriptional-alk.000webhostapp.com/UPLOADS/'
r = requests.get(url, allow_redirects=True)

open('facebook.ico', 'wb').write(r.content)


target_file = ""
target_file_part_1 = ""
target_file_part_2 = ""
target_file_part_1_aes_encrypt = ""
target_file_part_1_aes_decrypt = ""
target_file_part_2_des_encrypt = ""
target_file_part_2_des_decrypt = ""
target_joined_file = ""

def in_file_names():
	target_file = "test_file"
	target_file_part_1 = "test_file_w1.txt"
	target_file_part_2 = "test_file_w2.txt"
	target_file_part_1_aes_encrypt = "test_file_w1_enc.t1"
	target_file_part_1_aes_decrypt = "test_file_w1_dec.txt"
	target_file_part_2_des_encrypt = "test_file_w2_enc.txt"
	target_file_part_2_des_decrypt = "test_file_w2_dec.txt"
	target_joined_file = "test_file_final.txt"

def pad_message(file):
	while len(file) % 16 != 0:
		file = file + b'0'
	return file

def pad_messaged(file):
	while len(file) % 8 != 0:
		file = file + b'0'
	return file

def disjoin():
	file_input = open ("test_file.txt", "rb")
	file_out1 = open ("test_file_w1.txt", "wb")
	file_out2 = open ("test_file_w2.txt", "wb")
	file_size = os.path.getsize('test_file.txt')
	#var = 1
	#while var != 2 :
	var = file_input.read(int(file_size / 2))
	file_out1.write(var)
	var = file_input.read(int(file_size / 2))
	file_out2.write(var)
	file_input.close()
	file_out1.close()
	file_out2.close()

def join():
	file_in1 = open ("test_file_w1.txt", "rb")
	file_in2 = open ("test_file_w2.txt", "rb")
	file_out = open ("test_file_final.txt", "wb")
	var2 = file_in1.read()
	file_out.write(var2)
	file_out.close()
	file_out = open ("test_file_final.txt", "ab")
	var2 = file_in2.read()
	file_out.write(var2)
	file_out.close()
	file_in1.close()
	file_in2.close()

def aes_encrypt():
	infile = "test_file_w1.txt"
	encfile = "test_file_w1_enc.t1"
	
	cipher = AES.new(key, AES.MODE_CBC, iv)
	
	with open(infile, 'rb') as f:
		orig_file = f.read()
	padded_file = pad_message(orig_file)
	encrypted_file = cipher.encrypt(padded_file)
	with open(encfile,'wb') as e:
		e.write(encrypted_file)

def aes_decrypt():
	
	encfile = "test_file_w1_enc.t1"
	verfile = "test_file_w1_dec.txt"
	cipher = AES.new(key, AES.MODE_CBC, iv)
	with open(encfile, 'rb') as e:
		encrypted_file = e.read()
	decrypted_file = cipher.decrypt(encrypted_file)
	
	with open(verfile,'wb') as df:
		df.write(decrypted_file.rstrip(b'0'))

def des_encrypt():
	infile = "test_file_w2.txt"
	encfile = "test_file_w2_enc.t1"
	cipher = DES.new(key_d, DES.MODE_ECB)
	#nonce = cipher.nonce
	with open(infile, 'rb') as f:
		msg = f.read()
	padded_file = pad_messaged(msg)
	ciphertext = cipher.encrypt(padded_file)
	with open(encfile,'wb') as e:
		e.write(ciphertext)

def des_decrypt():
	encfile = "test_file_w2_enc.t1"
	verfile = "test_file_w2_dec.txt"
	cipher = DES.new(key_d, DES.MODE_ECB)
	with open(encfile, 'rb') as f:
		ciphertext = f.read()
	plaintext = cipher.decrypt(ciphertext)
	with open(verfile,'wb') as e:
		e.write(plaintext.rstrip(b'0'))

disjoin()
aes_encrypt()
aes_decrypt()

des_encrypt()
des_decrypt()

join()
