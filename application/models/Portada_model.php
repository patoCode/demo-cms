<?php
class Portada_model extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}


	public function loadHome()
	{
		$this->db->select('path, principal');
		$this->db->from('com_portada');
		$this->db->where('principal', 'si');
		$this->db->order_by('orden', 'asc');
		$query = $this->db->get();
		return $query->result();
	}
	public function totalPortadas()
	{
		$this->db->from('com_portada');
		$this->db->where('principal', 'si');
		$query = $this->db->get();
		return $query->num_rows();
	}
}