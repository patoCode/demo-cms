<?php
class Buzon_model extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}
	public function insert($data)
	{
		return $this->db->insert('com_buzon', $data);
	}
}