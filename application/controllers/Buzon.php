<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Buzon extends CI_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->load->model('Archivo_model','archivo');
		$this->load->model('Menu_model','menu');
		$this->load->model('Album_model','album');
		$this->load->model('Buzon_model','buzon');
	}
	public function index($alert= null)
	{
		$data['sistemas']          = $this->sistema->getSistemas();
		$data['cumpleanieros_dia'] = $this->funcionario->getCumpleaneros(0);
		$data['cumpleanieros_mes'] = $this->funcionario->getCumpleaneros(1);
		$data['lista'] = 'buzon';
		$menu = $this->menu->getPrivilegios($this->session->userdata('id_cargo'));
		$data['menu'] = $menu;
		if($alert != null){
			$data['msg'] = $alert['msg'];
			$data['error'] = $alert['error'];
		}
		$this->load->view('lista', $data);
	}
	public function save()
	{
		$sugerencia = "";
		$nombre= "";
		$mensaje = "";
		if($this->input->post()){
			$sugerencia = trim($this->input->post("sugerencia"));
			$nombre = trim($this->input->post("nombre"));
		}
		$ip = $this->getUserIP();
		$fecha = date("Y-m-d");
		$input = array("sugerencia" => $sugerencia, "ip" =>$ip,"fecha" =>$fecha,"nombre" =>$nombre);
		if($sugerencia == ""){
				$alert = array("msg" => "Debe completar al menos, el campo Sugerencia","error" => 1);
		}else{
			if($this->buzon->insert($input)){
				$alert = array("msg" => "Su sugerencia fue recepcionada, gracias!","error" => 0);
			}else{
				$alert = array("msg" => "Error","error" => 1);
			}
		}
		$this->index($alert);
	}
	function getUserIP()
	{
	    $client  = @$_SERVER['HTTP_CLIENT_IP'];
	    $forward = @$_SERVER['HTTP_X_FORWARDED_FOR'];
	    $remote  = $_SERVER['REMOTE_ADDR'];

	    if(filter_var($client, FILTER_VALIDATE_IP))
	    {
	        $ip = $client;
	    }
	    elseif(filter_var($forward, FILTER_VALIDATE_IP))
	    {
	        $ip = $forward;
	    }
	    else
	    {
	        $ip = $remote;
	    }

	    return $ip;
	}
}