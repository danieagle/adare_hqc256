with Interfaces.C;

package Adare_Hqc256.hqc
  with Pure
is
  hqc_private_key_length  :   constant Interfaces.C.size_t;
  hqc_public_key_length   :   constant Interfaces.C.size_t;
  hqc_shared_key_length   :   constant Interfaces.C.size_t;
  hqc_ciphertext_length   :   constant Interfaces.C.size_t;


  type hqc_private_key is private
      with Preelaborable_Initialization;

  type hqc_public_key  is private
      with Preelaborable_Initialization;

  type hqc_shared_key  is private
      with Preelaborable_Initialization;

  type hqc_ciphertext  is private
      with Preelaborable_Initialization;


  function    get_hqc_private_key (from_key   :   aliased hqc_private_key)    return Interfaces.C.char_array;
  function    get_hqc_public_key  (from_key   :   aliased hqc_public_key) return Interfaces.C.char_array;
  function    get_hqc_shared_key  (from_key   :   aliased hqc_shared_key) return Interfaces.C.char_array;
  function    get_hqc_ciphertext  (from_ciphertext    :   aliased hqc_ciphertext) return Interfaces.C.char_array;

  procedure hqc_256_kem_keypair
      (public_key     :   out hqc_public_key;
        private_key    :   out hqc_private_key);

  procedure hqc_256_kem_encode
      (ciphertext     :   out hqc_ciphertext;
        shared_secret  :   out hqc_shared_key;
        public_key     :   aliased in hqc_public_key);

  procedure hqc_256_kem_decode
      (shared_secret  :   out hqc_shared_key;
        ciphertext     :   aliased in hqc_ciphertext;
        secret_key     :   aliased in hqc_private_key);

private

  hqc_private_key_length  :   constant Interfaces.C.size_t   :=  7317;
  hqc_public_key_length   :   constant Interfaces.C.size_t   :=  7245;
  hqc_shared_key_length   :   constant Interfaces.C.size_t   :=  64;
  hqc_ciphertext_length   :   constant Interfaces.C.size_t   :=  14421;

  type hqc_private_key is
      record
          val :   aliased Interfaces.C.char_array (1 .. hqc_private_key_length)    :=  (others => Interfaces.C.char'Val (0));
      end record;

  type hqc_public_key  is
      record
          val :   aliased Interfaces.C.char_array (1 .. hqc_public_key_length)    :=  (others =>  Interfaces.C.char'Val (0));
      end record;

  type hqc_shared_key  is
      record
          val :   aliased Interfaces.C.char_array (1 .. hqc_shared_key_length)  :=  (others =>  Interfaces.C.char'Val (0));
      end record;

  type hqc_ciphertext  is
      record
          val :   aliased Interfaces.C.char_array (1 .. hqc_ciphertext_length)   :=  (others =>  Interfaces.C.char'Val (0));
      end record;

end Adare_Hqc256.hqc;
