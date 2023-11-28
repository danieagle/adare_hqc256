
with Adare_Hqc256.inners;

package body Adare_Hqc256.hqc
  with Pure
is

  function    get_hqc_private_key (from_key   :   aliased hqc_private_key)    return Interfaces.C.char_array
  is (Interfaces.C.char_array'(from_key.val));

  function    get_hqc_public_key  (from_key   :   aliased hqc_public_key) return Interfaces.C.char_array
  is (Interfaces.C.char_array'(from_key.val));

  function    get_hqc_shared_key  (from_key   :   aliased hqc_shared_key) return Interfaces.C.char_array
  is (Interfaces.C.char_array'(from_key.val));

  function    get_hqc_ciphertext  (from_ciphertext    :   aliased hqc_ciphertext) return Interfaces.C.char_array
  is (Interfaces.C.char_array'(from_ciphertext.val));


  use Adare_Hqc256.inners;

  procedure hqc_256_kem_keypair
      (public_key     :   out hqc_public_key;
        private_key    :   out hqc_private_key)
  is
      v   :   constant Interfaces.C.int    :=
          internal_hqc_256_kem_keypair (public_key.val'Address, private_key.val'Address)
              with Unreferenced;
  begin
      null;
  end hqc_256_kem_keypair;


  procedure hqc_256_kem_encode
      (ciphertext     :   out hqc_ciphertext;
        shared_secret  :   out hqc_shared_key;
        public_key     :   aliased in hqc_public_key)
  is
      v   :   constant Interfaces.C.int    :=
          internal_hqc_256_kem_enc (ciphertext.val'Address, shared_secret.val'Address, public_key.val'Address)
              with Unreferenced;
  begin
      null;
  end hqc_256_kem_encode;


  procedure hqc_256_kem_decode
      (shared_secret  :   out hqc_shared_key;
        ciphertext     :   aliased in hqc_ciphertext;
        secret_key     :   aliased in hqc_private_key)
  is
      v   :   constant Interfaces.C.int    :=
          internal_hqc_256_kem_dec (shared_secret.val'Address, ciphertext.val'Address, secret_key.val'Address)
              with Unreferenced;
  begin
      null;
  end hqc_256_kem_decode;

end Adare_Hqc256.hqc;
