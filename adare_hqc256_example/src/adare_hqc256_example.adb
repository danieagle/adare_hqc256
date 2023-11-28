
with Ada.Text_IO;
with Interfaces.C;
with Adare_Hqc256.hqc;

use Ada;
use Adare_Hqc256;

procedure Adare_Hqc256_Example is

  -- hint: each type can be copied to other var of same type without problems.

  secret_key1 : aliased hqc.hqc_private_key;
  public_key1 : aliased hqc.hqc_public_key;

  shared_secret1 : aliased hqc.hqc_shared_key;

  shared_secret2 : aliased hqc.hqc_shared_key;

  ciphertext1 : aliased hqc.hqc_ciphertext;

  ciphertext2 : aliased hqc.hqc_ciphertext;

  use all type hqc.hqc_shared_key;
begin
  hqc.hqc_256_kem_keypair (public_key1, secret_key1);

  Text_IO.New_Line;

  Text_IO.Put_Line (" Public Key1" & public_key1'Image);

  Text_IO.New_Line;

  Text_IO.Put_Line (" Secret Key1" & secret_key1'Image);

  hqc.hqc_256_kem_encode (ciphertext1, shared_secret1, public_key1);

  Text_IO.New_Line;

  Text_IO.Put_Line (" Shared_Secret1" & shared_secret1'Image);

  Text_IO.New_Line;

  Text_IO.Put_Line (" CipherText1" & ciphertext1'Image);

  ciphertext2 := ciphertext1; -- just for backup or maybe offload

  hqc.hqc_256_kem_decode (shared_secret2, ciphertext1, secret_key1);

  Text_IO.New_Line;

  Text_IO.Put_Line (" Shared_Secret2" & shared_secret2'Image);

  Text_IO.New_Line;

  Text_IO.Put_Line
  (" received shared_secret2 = to sended shared_secret1 ?" &
    Boolean'(shared_secret2 = shared_secret1)'Image);

  Text_IO.New_Line (2);

  b2 :
  declare
    sk1 : Interfaces.C.char_array :=
    hqc.get_hqc_private_key (secret_key1);
    pk1 : Interfaces.C.char_array :=
    hqc.get_hqc_public_key (public_key1);
    ss2 : Interfaces.C.char_array :=
    hqc.get_hqc_shared_key (shared_secret2);
    ct1 : Interfaces.C.char_array :=
    hqc.get_hqc_ciphertext (ciphertext1);
  begin

    Text_IO.Put_Line (" sk1 =>  " & sk1'Image);

    Text_IO.New_Line;

    Text_IO.Put_Line (" pk =>  " & pk1'Image);

    Text_IO.New_Line;

    Text_IO.Put_Line ("  =>  " & ss2'Image);

    Text_IO.New_Line;

    Text_IO.Put_Line ("  =>  " & ct1'Image);

    Text_IO.New_Line (2);

  end b2;

  Text_IO.Put_Line (" Enjoy!!! :-]");
  Text_IO.New_Line (2);

end Adare_Hqc256_Example;
