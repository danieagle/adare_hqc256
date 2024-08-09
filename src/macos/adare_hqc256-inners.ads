
with Interfaces.C;
with System;

package Adare_Hqc256.inners with Pure is

  function internal_hqc_256_kem_keypair
    (public_key_i   :   System.Address; -- out
     private_key_i  :   System.Address  -- out
    ) return Interfaces.C.int

    with Import => True, Convention => C, External_Name => "PQCLEAN_HQC256_CLEAN_crypto_kem_keypair";

  function internal_hqc_256_kem_enc
    (ciphertext_i       :   System.Address; -- out
     shared_secret_i    :   System.Address; -- out
     public_key_i       :   System.Address  -- in
    ) return Interfaces.C.int

    with Import => True, Convention => C, External_Name => "PQCLEAN_HQC256_CLEAN_crypto_kem_enc";

  function internal_hqc_256_kem_dec
    (shared_secret_i    :   System.Address; -- out
     ciphertext_i       :   System.Address; -- in
     secret_key_i       :   System.Address  -- in
    ) return Interfaces.C.int

    with Import => True, Convention => C, External_Name => "PQCLEAN_HQC256_CLEAN_crypto_kem_dec";

end Adare_Hqc256.inners;
