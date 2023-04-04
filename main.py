from rsa import RSA


def main():
    rsa = RSA()
    rsa.key_gen()
    filename = "file.txt"
    signed_file = 'signed_' + filename
    with open(filename, 'r') as f:
        with open(signed_file, 'w') as sf:
            sign = rsa.encrypt(f.read())
            sf.write(str(sign))


if __name__ == "__main__":
    main()


