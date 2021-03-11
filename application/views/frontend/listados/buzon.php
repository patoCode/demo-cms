<section id="title" class="emerald">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <h1><i class="fa fa-fw fa-inbox"></i> Buzón de sugerencias</h1>
                <p>Buzón de sugerencias</p>
            </div>
        </div>
    </div>
</section>
<div class="row">
	<div class="container" style="margin-top:30px;min-height:485px;">
		<div class="col-md-12">
			<?php if(isset($msg) && $msg != ""): ?>
				<div class="alert <?php if($error==0){ echo "alert-success";}else{ echo "alert-danger";} ?>">
					<?php echo $msg; ?>
				</div>
			<?php endif; ?>
				<form action="<?php echo base_url(); ?>Buzon/save" method="POST" >
					<div class="form-group">
					    <label for="Name">Nombre:</label>
					    <input type="text" class="form-control" name="nombre" placeholder="Puede dejar en blanco para que sea anónimo">
					  </div>
					  <div class="form-group">
					    <label for="sugerencia">Sugerencia:</label>
					    <?php  echo form_textarea('sugerencia', '',array('class'=>'form-control'));?>
					  </div>
					  <input type="submit" class="btn btn-success" value="Enviar sugerencia">
				</form>
		</div>
	</div>
</div>