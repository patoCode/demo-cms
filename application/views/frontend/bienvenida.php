<section id="main-slider" class="no-margin">
    <div class="carousel slide wet-asphalt">
        <ol class="carousel-indicators">
            <?php for($i = 0;$i < $total_portadas;$i++): ?>
                <li data-target="#main-slider" data-slide-to="<?php echo $i; ?>" class="<?php if($i==0) echo 'active'; ?>"></li>
            <?php endfor; ?>
        </ol>
        <div class="carousel-inner">
            <?php $count = 0; foreach ($portada as $image): ?>
                <div class="item <?php if($count>0) echo ''; else echo 'active';?>" style="background-image: url(<?php echo base_url().PATH_PORTADAS.$image->path; ?>)">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="carousel-content centered">
                                    <?php if($count == 0): ?>
                                    <h2 class="boxed animation animated-item-1"><?php echo COMPANY_INTRANET?></h2><br>
                                    <p class="boxed animation animated-item-2">
                                        Bienvenido <?php echo $this->session->userdata('nombres').' '.$this->session->userdata('apellido_pat').' '.$this->session->userdata('apellido_mat'); ?>
                                    </p>
                                <?php endif; ?>
                                <?php if($count == 1): ?>
                                    <h2 class="boxed animation animated-item-1">Pensamiento del Día</h2>
                                    <br>
                                    <div class="boxed animation animated-item-2">
                                        <?php
                                        foreach ($mensaje as $msj) {
                                            echo $msj->mensaje.$msj->autor;
                                        }
                                        ?>
                                    </div>
                                    <br>
                                <?php endif; ?>
                                <?php if($count == 2): ?>
                                    <h2 class="animation animated-item-1">
                                    <?php echo date("d/m/Y"); ?>
                                    </h2>
                                    <p class="animation animated-item-2" id="reloj"></p>
                                <?php endif; ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!--/.item-->
            <?php $count++;endforeach; ?>


        </div><!--/.carousel-inner-->
    </div><!--/.carousel-->
    <a class="prev hidden-xs" href="#main-slider" data-slide="prev">
        <i class="icon-angle-left"></i>
    </a>
    <a class="next hidden-xs" href="#main-slider" data-slide="next">
        <i class="icon-angle-right"></i>
    </a>
</section><!--/#main-slider-->