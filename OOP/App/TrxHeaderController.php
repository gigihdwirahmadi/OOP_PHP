<?php
namespace OOP\App;
class TrxHeaderController{
    private $header;
    public function __construct(){
        $this->header= new TrxHeaders();
    }
    public function index(){
        print_r($this->header->all());
    }
    public function show($id){
        print_r($this->header->find($id));
    }
    public function add(){
        $data = [
            'info_id' => 1,
            'transaktion_time' => date('Y-m-d H-i-s'),
            'discount' => 0,
            'price_total' => 23000,
            'payment' => 30000,
            'exchange' => 7000,
            'created_at' => date('Y-m-d H-i-s'),
        ];
        print_r($this->header->insert($data));
        
    }
    public function update(){
        $update =[
            'id' => 1,
            'info_id' => 1,
            'transaktion_time' => date('Y-m-d H-i-s'),
            'discount' => 0,
            'price_total' => 23000,
            'payment' => 30000,
            'exchange' => 7000,
            'created_at' => date('Y-m-d H-i-s'),
        ];
        print_r($this->header->update($update));
    }
    public function delete(){
        $id=2;
        print_r($this->header->delete($id));
    }
}