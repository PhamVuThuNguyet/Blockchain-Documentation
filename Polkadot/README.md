# Advanced
## Accounts
### Address format
Polkadot sử dụng định dạng địa chỉ mặc định của Substrate-based chains là SS58. Đây là một định dạng được chỉnh sửa từ Bitcoin Base-58-check. Tiền tố của định dạng này thay đổi tuỳ thuộc theo loại chain.

Về cơ bản, một địa chỉ SS58 được mã hoá theo dạng sau:
```base58encode ( concat ( <address-type>, <address>, <checksum> ) )```

Trong đó, base58encode là một hàm mã hoá sử dụng base58 scheme. 

![Base58 Scheme](../imgs/base58.png)

### Derivation paths
Deviration paths cho phép chúng ta có thể tạo và quản lý nhiều account cùng một gốc (seed). Chúng ta có thể coi các accounts phái sinh (derived accounts) là những accounts con của một account gốc, được tạo ra bằng cách sử dụng mnemonic seed phrase ban đầu.

Có 3 loại:
- Hard derivation
    ```'caution juice atom organ advance problem want pledge someone senior holiday very//0'```
- Soft derivation
    ```'caution juice atom organ advance problem want pledge someone senior holiday very/0'```

Để tạo ra một account phái sinh, chúng ta chỉ cần thay đổi số ở cuối mnemonic seed phrase trên. Chúng ta cũng có thể tự đặt custom derivation path cho mình, ví dụ: 
```//john/polkadot/initial```

- Password derivation: 
    ```'caution juice atom organ advance problem want pledge someone senior holiday very///0'```

Đối với 2 loại trên, nếu ai đó biết mnemonic seed phrase và derivation path, họ có thể truy cập vào trong tài khoản đó. Còn trong loại này, chỉ có thể tạo và truy cập tài khoản phái sinh nếu chúng ta có mật khẩu. Nói cách khác, về mặt toán học, khi chúng ta biết được derivation path (về mặt văn bản) và mật khẩu, chúng ta có thể tính toán ra path thực tế thông qua hàm f(written path, password). Sau đó, chúng ta sẽ tìm được key pair thông qua hàm f(seed, real path) để truy cập vào tài khoản.

- So sánh soft & hard derivation:
    - Soft derivation cho phép người dùng "truy ngược" để tìm ra private key của account gốc nếu họ biết private key của account phái sinh. Ngoài ra, soft derivation thể hiện được sự liên kết giữa các accounts cùng seed. Nói cách khác, soft derivation cho phép proof-of-parent.
    - Hard derivation không cho phép điều đó

## Cryptography on Polkadot
### Hashing algorithm
Polkadot sử dụng thuật toán Blake2b.

![Blake2b](../imgs/internal_structure_of_blake2b.png)

Blake2b có thể được chia thành 2 phần:
- Module generateBlock: pad đầu vào thành các khối fixed size sau đó thông báo cho module digest. Mỗi khối (chunk) trong blake2b có 16 message words (128-byte chunk), mỗi message word là 64 bits (8-byte word).
- Module blake2bDigest: Tính toán hash values

Pseudocode của thuật toán blake2b. Tham khảo thêm tại https://en.wikipedia.org/wiki/BLAKE_(hash_function)#BLAKE2b_algorithm 
```
Algorithm BLAKE2b
   Input:
      M                               Message to be hashed
      cbMessageLen: Number, (0..2128)  Length of the message in bytes
      Key                             Optional 0..64 byte key
      cbKeyLen: Number, (0..64)       Length of optional key in bytes
      cbHashLen: Number, (1..64)      Desired hash length in bytes
   Output:
      Hash                            Hash of cbHashLen bytes

   Initialize State vector h with IV
   h0..7 ← IV0..7

   Mix key size (cbKeyLen) and desired hash length (cbHashLen) into h0
   h0 ← h0 xor 0x0101kknn
         where kk is Key Length (in bytes)
               nn is Desired Hash Length (in bytes)

   Each time we Compress we record how many bytes have been compressed
   cBytesCompressed ← 0
   cBytesRemaining  ← cbMessageLen

   If there was a key supplied (i.e. cbKeyLen > 0) 
   then pad with trailing zeros to make it 128-bytes (i.e. 16 words) 
   and prepend it to the message M
   if (cbKeyLen > 0) then
      M ← Pad(Key, 128) || M
      cBytesRemaining ← cBytesRemaining + 128
   end if

   Compress whole 128-byte chunks of the message, except the last chunk
   while (cBytesRemaining > 128) do
      chunk ← get next 128 bytes of message M
      cBytesCompressed ← cBytesCompressed + 128  increase count of bytes that have been compressed
      cBytesRemaining  ← cBytesRemaining  - 128  decrease count of bytes in M remaining to be processed

      h ← Compress(h, chunk, cBytesCompressed, false)  false ⇒ this is not the last chunk
   end while

   Compress the final bytes from M
   chunk ← get next 128 bytes of message M  We will get cBytesRemaining bytes (i.e. 0..128 bytes)
   cBytesCompressed ← cBytesCompressed+cBytesRemaining  The actual number of bytes leftover in M
   chunk ← Pad(chunk, 128)  If M was empty, then we will still compress a final chunk of zeros

   h ← Compress(h, chunk, cBytesCompressed, true)  true ⇒ this is the last chunk

   Result ← first cbHashLen bytes of little endian state vector h
End Algorithm BLAKE2b
```