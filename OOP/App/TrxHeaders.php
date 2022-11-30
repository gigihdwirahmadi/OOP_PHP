<?php
namespace OOP\App;

class TrxHeaders extends Database
{
    public function all()
    {
        $statement = self::$conn->prepare("select * from trx_hdr");
        $statement->execute();
        return $statement->fetchAll(\PDO::FETCH_OBJ);
    }
    public function find($id)
    {
        $statement = self::$conn->prepare("select * from trx_hdr where id=$id");
        $statement->execute();
        return $statement->fetch(\PDO::FETCH_OBJ);
    }
    public function findarr($id)
    {
        $statement = self::$conn->prepare("select * from trx_hdr where id=$id");
        $statement->execute();
        return $statement->fetch();
    }
    public function insert($data)
    {
        $statement = self::$conn->prepare("INSERT INTO trx_hdr(info_id, transaktion_time,  discount,price_total,payment, exchange, created_at) 
        values(:info_id, :transaktion_time, :discount,:price_total,:payment,:exchange,:created_at)");
        return $statement->execute($data);
    }
    public function update($data)
    {
        $statement = self::$conn->prepare("UPDATE trx_hdr set info_id=:info_id, transaktion_time= :transaktion_time,  discount= :discount,price_total=:price_total,payment=:payment, exchange=:exchange, created_at=:created_at where id = :id");
        return $statement->execute($data);
    }
    public function delete($id){

        $statement = self::$conn->prepare("DELETE from trx_hdr where id = :id");
        return $statement->execute(['id'=> $id]);
    }
}
// $trxHeader = New Trxheaders();
// try {
//     $trxHeader = new Trxheaders();
//     //dari objek ke array
//     // echo("bentuk objek<br>");
//     // print_r($trxHeader->find(1));
//     // $data2=$trxHeader->find(1);
//     // print_r("<br>");
//     // echo $data2->id;
//     // print_r("<br>");
//     // //dari array objek array
//     // echo("bentuk array<br>");
//     // $data=($trxHeader->findarr(1));
//     // var_dump($data);
//     // print_r("<br>");
//     // echo $data["id"];
//     $insert = [
//         'id' => 1,
//         'info_id' => 1,
//         'transaktion_time' => date('Y-m-d H-i-s'),
//         'discount' => 0,
//         'price_total' => 23000,
//         'payment' => 30000,
//         'exchange' => 7000,
//         'created_at' => date('Y-m-d H-i-s'),
//     ];
    
//     $trxHeader->delete(2);

// } catch (Throwable $th) {
//     throw $th;
// }