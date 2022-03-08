\m4_TLV_version 1d: tl-x.org

\TLV fpga_refresh($_var, #_delay)
   /* verilator lint_off UNSIGNED */
   $rst['']m4_plus_inst_id = *reset;
   $count['']m4_plus_inst_id[31:0] = ($RETAIN >= #_delay - 1) | >>1$rst['']m4_plus_inst_id ? 1'b0 : $RETAIN + 1 ; 
   $_var = ($count['']m4_plus_inst_id == #_delay - 1) ? 1'b1 : 1'b0 ;
   
\TLV osfpga_logo()
   |osfpga_logo_macro
      @0
         m4_ifelse_block(M4_MAKERCHIP, 1, ['
         \viz_alpha
               initEach() {
                  let osfpga_logo_url = "https://user-images.githubusercontent.com/64545984/131954393-6e21a24e-ee4e-44dc-b30f-2347c2229812.jpg"
                     let osfpga_img = new fabric.Image.fromURL(
                           osfpga_logo_url,
                           function (img) {
                              global.canvas.add(img)
                           },
                           {originX: "center",
                            originY: "center",
                            left: 300,
                            top: -230,
                            scaleX: 0.15,
                            scaleY: 0.15,
                            angle: 0
                           }
                        )
                   }
         '])
\TLV fpga_init()
   //m4+osfpga_logo()
   |fpga_init_macro
      @0
         m4_ifelse_block(M4_MAKERCHIP, 1, [' 
         m4_ifelse_block(M4_BOARD, 1,['
         \viz_alpha
            initEach() {
                  let fpga_img_url = "https://user-images.githubusercontent.com/64545984/130666264-972dfe58-c2c8-4446-b0d3-eb9587fd3458.png"
                  let fpga_img = new fabric.Image.fromURL(
                        fpga_img_url,
                        function (img) {
                           global.canvas.add(img)
                           global.canvas.sendToBack(img);
                        },
                        {originX: "center",
                         originY: "center",
                         left: 0,
                         top: 10,
                         scaleX: 0.3,
                         scaleY: 0.3,
                         angle: 0
                        }
                     )
                }
         '],['
         m4_ifelse_block(M4_BOARD, 2,['
         \viz_alpha
            initEach() {
                  let fpga_img_url = "https://user-images.githubusercontent.com/64545984/130667389-08904919-5425-4ef3-aae4-c2dacf41f1c7.png"
                  let fpga_img = new fabric.Image.fromURL(
                        fpga_img_url,
                        function (img) {
                           global.canvas.add(img)
                           global.canvas.sendToBack(img);
                        },
                        {originX: "center",
                         originY: "center",
                         left: 0,
                         top: 10,
                         scaleX: 0.18,
                         scaleY: 0.18,
                         angle: 0
                        }
                     )
                  let seg = new fabric.Rect({
                     top: 60,
                     left: -244,
                     width: 140, 
                     height: 60, 
                     fill: "black",
                     opacity: 1
                  })
                return {objects :{seg}};
                
                }
         /digit[3:0]
            /led[7:0]
               \viz_alpha
                  initEach() {
                     let sseg = (scopes.led.index == 7) ? new fabric.Circle({
                           top: 109,
                           left: (scopes.digit.index == 3) ? -122 : (scopes.digit.index == 0) ? -212 : (scopes.digit.index == 1) ? -182 : -152 ,
                           radius: 2,
                           opacity: 1,
                           fill: "grey"
                        }) 
                        :
                        new fabric.Rect({
                           top: 76 + ((scopes.led.index == 1) ? -4 : (scopes.led.index == 2) ? 16 : (scopes.led.index == 3) ? 31 : (scopes.led.index == 4) ? 16 : (scopes.led.index == 5) ? -4 : (scopes.led.index == 6) ? 11 : -8),
                           left: ((scopes.digit.index == 0) ? -224 : (scopes.digit.index == 1) ? -194 : (scopes.digit.index == 2) ? -164 : -134) + ((scopes.led.index == 5) ? 13 : (scopes.led.index == 4) ? 11 : (scopes.led.index == 3) ? -2 : (scopes.led.index == 2) ? -8 : (scopes.led.index == 1) ? -6 : -1),
                           width: ((this.getIndex() == 6) || (this.getIndex() == 3) || (this.getIndex() == 0)) ? 14 : 3,
                           height: ((this.getIndex() == 5) || (this.getIndex() == 4) || (this.getIndex() == 2) || (this.getIndex() == 1)) ? 14 : 3,
                           fill: "grey",
                           skewX: ((this.getIndex() == 5) || (this.getIndex() == 4) || (this.getIndex() == 2) || (this.getIndex() == 1)) ? -9 : 0,
                           opacity: 1
                        })
                     return{objects : {sseg}};
                  }
         '],['
         m4_ifelse_block(M4_BOARD, 3,['
         \viz_alpha
            initEach() {
                  let fpga_img_url = "https://user-images.githubusercontent.com/64545984/130667995-6ea5cc8f-400c-470b-9585-5f8ba5bab0b9.png"
                  let fpga_img = new fabric.Image.fromURL(
                        fpga_img_url,
                        function (img) {
                           global.canvas.add(img)
                           global.canvas.sendToBack(img);
                        },
                        {originX: "center",
                         originY: "center",
                         left: 0,
                         top: 10,
                         scaleX: 0.09,
                         scaleY: 0.09,
                         angle: 0
                        }
                     )
                  let seg = new fabric.Rect({
                           top: 50,
                           left: -182,
                           width: 124, 
                           height: 39, 
                           fill: "black",
                           opacity: 1
                        })
                return {objects :{seg}};
                }
         /digit[3:0]
            /led[7:0]
               \viz_alpha
                  initEach() {
                     let sseg = (scopes.led.index == 7) ? new fabric.Circle({
                           top: 79,
                           left: (scopes.digit.index == 0) ? -157 : (scopes.digit.index == 1) ? -127 : (scopes.digit.index == 2) ? -97 : -67 ,
                           radius: 2,
                           opacity: 1,
                           fill: "grey"
                        }) 
                        :
                        new fabric.Rect({
                           top: 56 + ((scopes.led.index == 5) ? 1 : (scopes.led.index == 4) ? 13 : (scopes.led.index == 3) ? 23 : (scopes.led.index == 2) ? 13 : (scopes.led.index == 1) ? 1 : (scopes.led.index == 0) ? 11 : 0),
                           left: ((scopes.digit.index == 0) ? -169 : (scopes.digit.index == 1) ? -139 : (scopes.digit.index == 2) ? -109 : -79) + ((scopes.led.index == 5) ? 10 : (scopes.led.index == 4) ? 8 : (scopes.led.index == 3) ? -2 : (scopes.led.index == 2) ? -6 : (scopes.led.index == 1) ? -4 : 0),
                           width: ((this.getIndex() == 6) || (this.getIndex() == 3) || (this.getIndex() == 0)) ? 11 : 3,
                           height: ((this.getIndex() == 5) || (this.getIndex() == 4) || (this.getIndex() == 2) || (this.getIndex() == 1)) ? 11 : 3,
                           fill: "grey",
                           skewX: ((this.getIndex() == 5) || (this.getIndex() == 4) || (this.getIndex() == 2) || (this.getIndex() == 1)) ? -9 : 0,
                           opacity: 1
                        })
                     return{objects : {sseg }};
                  }
         '],['
         m4_ifelse_block(M4_BOARD, 4,['
         \viz_alpha
            initEach() {
                  console.log(M4_BOARD)
                  let fpga_img_url = "https://user-images.githubusercontent.com/64545984/130666826-b9e7bc53-104c-4b4b-8b2a-b8105edb00da.png"
                  let fpga_img = new fabric.Image.fromURL(
                        fpga_img_url,
                        function (img) {
                           global.canvas.add(img)
                           global.canvas.sendToBack(img);
                        },
                        {originX: "center",
                         originY: "center",
                         left: -100,
                         top: 10,
                         scaleX: 0.5,
                         scaleY: 0.5,
                         angle: 180
                        }
                     )
                }
         '],['
         m4_ifelse_block(M4_BOARD, 5,['
         \viz_alpha
            initEach() {
                  let fpga_img_url = "https://user-images.githubusercontent.com/64545984/130666896-00e2225d-0d4c-47c5-9493-af6512a430e4.png"
                  let fpga_img = new fabric.Image.fromURL(
                        fpga_img_url,
                        function (img) {
                           global.canvas.add(img)
                           global.canvas.sendToBack(img);
                        },
                        {originX: "center",
                         originY: "center",
                         scaleX: 1,
                         scaleY: 1,
                        }
                     )
                let seg = new fabric.Rect({
                     top: 90,
                     left: -126,
                     width: 218, 
                     height: 35, 
                     fill: "black",
                     opacity: 1
                  })
                
                return {objects :{seg}};
             }
         /digit[7:0]
            /led[7:0]
               \viz_alpha
                  initEach() {
                     let sseg = (scopes.led.index == 7) ? new fabric.Circle({
                           top: 119,
                           //left: (scopes.digit.index == 3) ? -122 : (scopes.digit.index == 0) ? -212 : (scopes.digit.index == 1) ? -182 : -152 ,
                           left : ((scopes.digit.index == 7) ? -104 : (scopes.digit.index == 6) ? -79 : (scopes.digit.index == 5) ? -54 : (scopes.digit.index == 4) ? -29 : (scopes.digit.index == 3) ? 6 : (scopes.digit.index == 2) ? 31 : (scopes.digit.index == 1) ? 56 : 81),
                           radius: 2,
                           opacity: 1,
                           fill: "grey"
                        }) 
                        :
                        new fabric.Rect({
                           top: 76 + ((scopes.led.index == 5) ? 19 : (scopes.led.index == 4) ? 32 : (scopes.led.index == 3) ? 43 : (scopes.led.index == 2) ? 32 : (scopes.led.index == 1) ? 19 : (scopes.led.index == 0) ? 30 : 18),
                           left: ((scopes.digit.index == 7) ? -114 : (scopes.digit.index == 6) ? -89 : (scopes.digit.index == 5) ? -64 : (scopes.digit.index == 4) ? -39 : (scopes.digit.index == 3) ? -4 : (scopes.digit.index == 2) ? 21 : (scopes.digit.index == 1) ? 46 : 71) + ((scopes.led.index == 5) ? 10 : (scopes.led.index == 4) ? 8 : (scopes.led.index == 3) ? -4 : (scopes.led.index == 2) ? -8 : (scopes.led.index == 1) ? -6 : (scopes.led.index == 0) ? -2 : -1),
                           width: ((this.getIndex() == 6) || (this.getIndex() == 3) || (this.getIndex() == 0)) ? 12 : 3,
                           height: ((this.getIndex() == 5) || (this.getIndex() == 4) || (this.getIndex() == 2) || (this.getIndex() == 1)) ? 11 : 3,
                           fill: "grey",
                           skewX: ((this.getIndex() == 5) || (this.getIndex() == 4) || (this.getIndex() == 2) || (this.getIndex() == 1)) ? -9 : 0,
                           opacity: 1
                        })
                     return{objects : {sseg}};
                  },
         '],['
         m4_ifelse_block(M4_BOARD, 6,['
         \viz_alpha
            initEach() {
                  let fpga_img_url = "https://raw.githubusercontent.com/12562/Triple_port_RAM/d2679875b32808e0d73e16b2d7b21dd8a2a6ab14/de10-lite.jpg"
                  let fpga_img = new fabric.Image.fromURL(
                        fpga_img_url,
                        function (img) {
                           global.canvas.add(img)
                           global.canvas.sendToBack(img);
                        },
                        {originX: "center",
                         originY: "center",
                         scaleX: 0.8,
                         scaleY: 0.8,
                         angle: -2,
                        }
                     )
                let seg = new fabric.Rect({
                     top: 0,
                     left: 0,
                     width: 218, 
                     height: 35, 
                     fill: "black",
                     opacity: 1
                  })
                
                return {objects :{seg}};
             }
         /digit[7:0]
            /led[7:0]
               \viz_alpha
                  initEach() {
                     let sseg = (scopes.led.index == 7) ? new fabric.Circle({
                           top: 119,
                           //left: (scopes.digit.index == 3) ? -122 : (scopes.digit.index == 0) ? -212 : (scopes.digit.index == 1) ? -182 : -152 ,
                           left : ((scopes.digit.index == 7) ? -104 : (scopes.digit.index == 6) ? -79 : (scopes.digit.index == 5) ? -54 : (scopes.digit.index == 4) ? -29 : (scopes.digit.index == 3) ? 6 : (scopes.digit.index == 2) ? 31 : (scopes.digit.index == 1) ? 56 : 81),
                           radius: 2,
                           opacity: 1,
                           fill: "grey"
                        }) 
                        :
                        new fabric.Rect({
                           top: 76 + ((scopes.led.index == 5) ? 19 : (scopes.led.index == 4) ? 32 : (scopes.led.index == 3) ? 43 : (scopes.led.index == 2) ? 32 : (scopes.led.index == 1) ? 19 : (scopes.led.index == 0) ? 30 : 18),
                           left: ((scopes.digit.index == 7) ? -114 : (scopes.digit.index == 6) ? -89 : (scopes.digit.index == 5) ? -64 : (scopes.digit.index == 4) ? -39 : (scopes.digit.index == 3) ? -4 : (scopes.digit.index == 2) ? 21 : (scopes.digit.index == 1) ? 46 : 71) + ((scopes.led.index == 5) ? 10 : (scopes.led.index == 4) ? 8 : (scopes.led.index == 3) ? -4 : (scopes.led.index == 2) ? -8 : (scopes.led.index == 1) ? -6 : (scopes.led.index == 0) ? -2 : -1),
                           width: ((this.getIndex() == 6) || (this.getIndex() == 3) || (this.getIndex() == 0)) ? 12 : 3,
                           height: ((this.getIndex() == 5) || (this.getIndex() == 4) || (this.getIndex() == 2) || (this.getIndex() == 1)) ? 11 : 3,
                           fill: "grey",
                           skewX: ((this.getIndex() == 5) || (this.getIndex() == 4) || (this.getIndex() == 2) || (this.getIndex() == 1)) ? -9 : 0,
                           opacity: 1
                        })
                     return{objects : {sseg}};
                  },
         '])
         '])
         '])
         '])
         '])
         '])
         '])
         
\TLV fpga_led($_leds)
   |led_pipe_macro
      @0
         m4_ifelse_block(M4_MAKERCHIP, 1, ['
         $led[\$size($_leds)-1:0] = $_leds;
         m4_ifelse_block(M4_BOARD, 1,['
         /led[7:0]
            \viz_alpha
               initEach() {
                  let led = new fabric.Rect({
                        top: 233,
                        left: 151 - 32 * (this.getIndex() + 1),
                        width: 6, 
                        height: 11, 
                        fill: "red",
                        opacity: 0
                     })
                  return{objects : {led}}; 
               }, 
               renderEach() {
                     var mod = ((('/top|led_pipe_macro$led'.asInt(-1) >> this.getScope("led").index) & 1) == 1);
                     this.getInitObject("led").set(mod ? {opacity: 1} : {opacity: 0});
                  }
         '],['
         m4_ifelse_block(M4_BOARD, 2,['
         /led[15:0]
            \viz_alpha
               initEach() {
                  let led = new fabric.Rect({
                        top: 150,
                        left: 218 - 27.5 * (this.getIndex() + 1),
                        width: 12, 
                        height: 12, 
                        fill: "red",
                        opacity: 0
                     })
                  return{objects : {led}}; 
               }, 
               renderEach() {
                     var mod = ((('/top|led_pipe_macro$led'.asInt(-1) >> this.getScope("led").index) & 1) == 1);
                     this.getInitObject("led").set(mod ? {opacity: 1} : {opacity: 0});
                  } 
         '],['
         m4_ifelse_block(M4_BOARD, 3,['
         /led[15:0]
            \viz_alpha
               initEach() {
                  let led = new fabric.Rect({
                        top: 92,
                        left: 195 - 25 * (this.getIndex() + 1),
                        width: 6, 
                        height: 10, 
                        fill: "red",
                        opacity: 0
                     })
                  return{objects : {led}}; 
               }, 
               renderEach() {
                     var mod = ((('/top|led_pipe_macro$led'.asInt(-1) >> this.getScope("led").index) & 1) == 1);
                     this.getInitObject("led").set(mod ? {opacity: 1} : {opacity: 0});
                  }  
         '],['
         m4_ifelse_block(M4_BOARD, 4,['

         
         '],['
         m4_ifelse_block(M4_BOARD, 5,['
         /led[15:0]
            \viz_alpha
               initEach() {
                  let led = new fabric.Rect({
                        top: 128,
                        left: 185 - 21.2 * (this.getIndex() + 1),
                        width: 8, 
                        height: 8, 
                        fill: "red",
                        opacity: 0
                     })
                  return{objects : {led}}; 
               }, 
               renderEach() {
                     var mod = ((('/top|led_pipe_macro$led'.asInt(-1) >> this.getScope("led").index) & 1) == 1);
                     this.getInitObject("led").set(mod ? {opacity: 1} : {opacity: 0});
               } 
         '])
         '])
         '])
         '])
         '])
         '])
         
\TLV fpga_template(|_pipe, @_stage, $leds)
   |_pipe
      @_stage
         m4_ifelse_block(M4_MAKERCHIP, 1, ['
         m4_ifelse_block(M4_BOARD, 1,['
         '],['
         m4_ifelse_block(M4_BOARD, 2,['
         '],['
         m4_ifelse_block(M4_BOARD, 3,['
         '],['
         m4_ifelse_block(M4_BOARD, 4,['
         '],['
         m4_ifelse_block(M4_BOARD, 5,['
         '])
         '])
         '])
         '])
         '])
         '])
         
\TLV fpga_sseg($_digit, $_sseg, $_dp)
   |sseg_pipe_macro
      @0
         m4_ifelse_block(M4_MAKERCHIP, 1, ['
         $digit[\$size($_digit)-1:0] = $_digit;
         $sseg[\$size($_sseg)-1:0] = $_sseg;
         $dp = $_dp;
         m4_ifelse_block(M4_BOARD, 1,['
         '],['
         m4_ifelse_block(M4_BOARD, 2,['
         /digit[3:0]
            /led[7:0]
               \viz_alpha
                  initEach() {
                     let sseg = (scopes.led.index == 7) ? new fabric.Circle({
                           top: 109,
                           left: (scopes.digit.index == 0) ? -122 : (scopes.digit.index == 3) ? -212 : (scopes.digit.index == 2) ? -182 : -152 ,
                           radius: 2,
                           opacity: 1,
                           fill: "grey"
                        }) 
                        :
                        new fabric.Rect({
                           top: 76 + ((scopes.led.index == 5) ? -4 : (scopes.led.index == 4) ? 16 : (scopes.led.index == 3) ? 31 : (scopes.led.index == 2) ? 16 : (scopes.led.index == 1) ? -4 : (scopes.led.index == 0) ? 11 : -8),
                           left: ((scopes.digit.index == 3) ? -224 : (scopes.digit.index == 2) ? -194 : (scopes.digit.index == 1) ? -164 : -134) + ((scopes.led.index == 5) ? 13 : (scopes.led.index == 4) ? 11 : (scopes.led.index == 3) ? -2 : (scopes.led.index == 2) ? -8 : (scopes.led.index == 1) ? -6 : -1),
                           width: ((this.getIndex() == 6) || (this.getIndex() == 3) || (this.getIndex() == 0)) ? 14 : 3,
                           height: ((this.getIndex() == 5) || (this.getIndex() == 4) || (this.getIndex() == 2) || (this.getIndex() == 1)) ? 14 : 3,
                           fill: "grey",
                           skewX: ((this.getIndex() == 5) || (this.getIndex() == 4) || (this.getIndex() == 2) || (this.getIndex() == 1)) ? -9 : 0,
                           opacity: 1
                        })
                     return{objects : {sseg}};
                  },
                  renderEach(){
                     var enable = ('/top|sseg_pipe_macro$digit'.asBinaryStr().split("").reverse().join(""));
                     this.getInitObject("sseg").bringToFront()
                     var fp_valid = '/top|sseg_pipe_macro$dp'.asBool() == 0
                     if(scopes.led.index == 7)
                     {
                        this.getInitObject("sseg").set(enable[scopes.digit.index] == 0 && fp_valid ? {fill: "red"} : {fill: "grey"})
                     }
                     else {
                        var hamm = ((('/top|sseg_pipe_macro$sseg'.asInt(-1) >> scopes.led.index) & 1) == 0);
                        this.getInitObject("sseg").set(hamm && enable[scopes.digit.index] == 0 ? {fill: "red"} : {fill: "grey"});
                     }
                  }
         '],['
         m4_ifelse_block(M4_BOARD, 3,['
         /digit[3:0]
            /led[7:0]
               \viz_alpha
                  initEach() {
                     let sseg = (scopes.led.index == 7) ? new fabric.Circle({
                           top: 79,
                           left: (scopes.digit.index == 3) ? -157 : (scopes.digit.index == 2) ? -127 : (scopes.digit.index == 1) ? -97 : -67 ,
                           radius: 2,
                           opacity: 1,
                           fill: "grey"
                        }) 
                        :
                        new fabric.Rect({
                           top: 56 + ((scopes.led.index == 5) ? 1 : (scopes.led.index == 4) ? 13 : (scopes.led.index == 3) ? 23 : (scopes.led.index == 2) ? 13 : (scopes.led.index == 1) ? 1 : (scopes.led.index == 0) ? 11 : 0),
                           left: ((scopes.digit.index == 3) ? -169 : (scopes.digit.index == 2) ? -139 : (scopes.digit.index == 1) ? -109 : -79) + ((scopes.led.index == 5) ? 10 : (scopes.led.index == 4) ? 8 : (scopes.led.index == 3) ? -2 : (scopes.led.index == 2) ? -6 : (scopes.led.index == 1) ? -4 : 0),
                           width: ((this.getIndex() == 6) || (this.getIndex() == 3) || (this.getIndex() == 0)) ? 11 : 3,
                           height: ((this.getIndex() == 5) || (this.getIndex() == 4) || (this.getIndex() == 2) || (this.getIndex() == 1)) ? 11 : 3,
                           fill: "grey",
                           skewX: ((this.getIndex() == 5) || (this.getIndex() == 4) || (this.getIndex() == 2) || (this.getIndex() == 1)) ? -9 : 0,
                           opacity: 1
                        })
                     return{objects : {sseg }};
                  },
                  renderEach() {
                     var enable = ('/top|sseg_pipe_macro$digit'.asBinaryStr().split("").reverse().join(""));
                     this.getInitObject("sseg").bringToFront()
                     var fp_valid = '/top|sseg_pipe_macro$dp'.asBool() == 0
                     if(scopes.led.index == 7)
                     {
                        this.getInitObject("sseg").set(enable[scopes.digit.index] == 0 && fp_valid ? {fill: "red"} : {fill: "grey"})
                     }
                     else {
                        var hamm = ((('/top|sseg_pipe_macro$sseg'.asInt(-1) >> scopes.led.index) & 1) == 0);
                        this.getInitObject("sseg").set(hamm && enable[scopes.digit.index] == 0 ? {fill: "red"} : {fill: "grey"});
                     }
                  }
         '],['
         m4_ifelse_block(M4_BOARD, 4,['
         \viz_alpha
            initEach() {
               let sseg_img_url = "https://user-images.githubusercontent.com/64545984/130668238-5f3cb129-7c02-4a62-96ee-d4e1cc7f6ee0.png"
               let sseg_img = new fabric.Image.fromURL(
                     sseg_img_url,
                     function (img) {
                        global.canvas.add(img)
                        global.canvas.sendToBack(img);
                     },
                     {originX: "center",
                      originY: "center",
                      left: 177,
                      top: 10,
                      scaleX: 0.3,
                      scaleY: 0.3,
                     }
                  )
                let sseg_img2 = new fabric.Image.fromURL(
                     sseg_img_url,
                     function (img) {
                        global.canvas.add(img)
                        global.canvas.sendToBack(img);
                     },
                     {originX: "center",
                      originY: "center",
                      left: 177,
                      top: -145,
                      scaleX: 0.3,
                      scaleY: 0.3,
                     }
                  )
                let seg = new fabric.Rect({
                  top: -60,
                  left: 130,
                  width: 176, 
                  height: 140, 
                  fill: "black",
                  opacity: 1
               })
               let seg1 = new fabric.Rect({
                  top: -215,
                  left: 130,
                  width: 176, 
                  height: 140, 
                  fill: "black",
                  opacity: 1
               })
             return {objects :{seg, seg1}};
             }
         /digit[3:0]
            /led[7:0]
               \viz_alpha
                  initEach() {
                     let sseg = (scopes.led.index == 7) ? new fabric.Circle({
                           top: (scopes.digit.index == 2) || (scopes.digit.index == 3) ? -110 : 42,
                           left: (scopes.digit.index == 0 | scopes.digit.index == 2) ? 270 : 195 ,
                           radius: 4,
                           opacity: 1,
                           fill: "grey"
                        }) 
                        :
                        new fabric.Rect({
                           top: (((scopes.digit.index == 2) || (scopes.digit.index == 3)) ? -160 : -10) + ((scopes.led.index == 5) ? -28 : (scopes.led.index == 4) ? 16 : (scopes.led.index == 3) ? 54 : (scopes.led.index == 2) ? 16 : (scopes.led.index == 1) ? -28 : (scopes.led.index == 0) ? 10 : -30),
                           left: ((scopes.digit.index == 0) || (scopes.digit.index == 2) ? 240 : 165) + ((scopes.led.index == 5) ? 26 : (scopes.led.index == 4) ? 19 : (scopes.led.index == 3) ? -12 : (scopes.led.index == 2) ? -20 : (scopes.led.index == 1) ? -13 : (scopes.led.index == 6) ? 1 : -5),
                           width: ((this.getIndex() == 6) || (this.getIndex() == 3) || (this.getIndex() == 0)) ? 30 : 6,
                           height: ((this.getIndex() == 5) || (this.getIndex() == 4) || (this.getIndex() == 2) || (this.getIndex() == 1)) ? 40 : 6,
                           fill: "grey",
                           skewX: ((this.getIndex() == 5) || (this.getIndex() == 4) || (this.getIndex() == 2) || (this.getIndex() == 1)) ? -9 : 0,
                           opacity: 1
                        })
                     return{objects : {sseg}};
                  },
                  renderEach() {
                     var enable = ('/top|sseg_pipe_macro$digit'.asBinaryStr().split("").reverse().join(""));
                     var dp = ('/top|sseg_pipe_macro$dp'.asBinaryStr());
                     this.getInitObject("sseg").bringToFront()
                     var fp_valid = dp == 0
                     if(scopes.led.index == 7)
                     {
                        this.getInitObject("sseg").set(enable[scopes.digit.index] == 0 && fp_valid ? {fill: "red"} : {fill: "grey"})
                     }
                     else {
                        var hamm = ((('/top|sseg_pipe_macro$sseg'.asInt(-1) >> scopes.led.index) & 1) == 0);
                        this.getInitObject("sseg").set(hamm && (enable[scopes.digit.index] == 0) ? {fill: "red"} : {fill: "grey"});
                     }
                  }
         '],['
         m4_ifelse_block(M4_BOARD, 5,['
         /digit[7:0]
            /led[7:0]
               \viz_alpha
                  initEach() {
                     let sseg = (scopes.led.index == 7) ? new fabric.Circle({
                           top: 119,
                           //left: (scopes.digit.index == 3) ? -122 : (scopes.digit.index == 0) ? -212 : (scopes.digit.index == 1) ? -182 : -152 ,
                           left : ((scopes.digit.index == 7) ? -104 : (scopes.digit.index == 6) ? -79 : (scopes.digit.index == 5) ? -54 : (scopes.digit.index == 4) ? -29 : (scopes.digit.index == 3) ? 6 : (scopes.digit.index == 2) ? 31 : (scopes.digit.index == 1) ? 56 : 81),
                           radius: 2,
                           opacity: 1,
                           fill: "grey"
                        }) 
                        :
                        new fabric.Rect({
                           top: 76 + ((scopes.led.index == 5) ? 19 : (scopes.led.index == 4) ? 32 : (scopes.led.index == 3) ? 43 : (scopes.led.index == 2) ? 32 : (scopes.led.index == 1) ? 19 : (scopes.led.index == 0) ? 30 : 18),
                           left: ((scopes.digit.index == 7) ? -114 : (scopes.digit.index == 6) ? -89 : (scopes.digit.index == 5) ? -64 : (scopes.digit.index == 4) ? -39 : (scopes.digit.index == 3) ? -4 : (scopes.digit.index == 2) ? 21 : (scopes.digit.index == 1) ? 46 : 71) + ((scopes.led.index == 5) ? 10 : (scopes.led.index == 4) ? 8 : (scopes.led.index == 3) ? -4 : (scopes.led.index == 2) ? -8 : (scopes.led.index == 1) ? -6 : (scopes.led.index == 0) ? -2 : -1),
                           width: ((this.getIndex() == 6) || (this.getIndex() == 3) || (this.getIndex() == 0)) ? 12 : 3,
                           height: ((this.getIndex() == 5) || (this.getIndex() == 4) || (this.getIndex() == 2) || (this.getIndex() == 1)) ? 11 : 3,
                           fill: "grey",
                           skewX: ((this.getIndex() == 5) || (this.getIndex() == 4) || (this.getIndex() == 2) || (this.getIndex() == 1)) ? -9 : 0,
                           opacity: 1
                        })
                     return{objects : {sseg}};
                  },
                  renderEach() {
                     var enable = ('/top|sseg_pipe_macro$digit'.asBinaryStr().split("").reverse().join(""));
                     this.getInitObject("sseg").bringToFront()
                     var fp_valid = '/top|sseg_pipe_macro$dp'.asBool() == 0
                     if(scopes.led.index == 7)
                     {
                        this.getInitObject("sseg").set(enable[scopes.digit.index] == 0 && fp_valid ? {fill: "red"} : {fill: "grey"})
                     }
                     else {
                        var hamm = ((('/top|sseg_pipe_macro$sseg'.asInt(-1) >> scopes.led.index) & 1) == 0);
                        this.getInitObject("sseg").set(hamm && enable[scopes.digit.index] == 0 ? {fill: "red"} : {fill: "grey"});
                     }
                  }
         '])
         '])
         '])
         '])
         '])
         '])
\TLV fpga_switch($_sw)
   |fpga_switch_macro
      @0
         m4_ifelse_block(M4_MAKERCHIP, 1, ['
         $sw[\$size($_sw)-1:0] = $_sw;
         m4_ifelse_block(M4_BOARD, 1,['
         /led[7:0]
            \viz_alpha
               initEach() {
                    //215
                    //172
                  let sw_1 = new fabric.Rect({
                        top: 260,
                        left: 145 - 32 * (this.getIndex() + 1),
                        width: 22, 
                        height: 50, 
                        fill: "#7F8B52",
                        rx:2,
                        ry:2,
                        opacity: 1
                     })
                  let sw_2 = new fabric.Rect({
                        top: 270,
                        left: 150 - 32 * (this.getIndex() + 1),
                        width: 12, 
                        height: 30, 
                        fill: "#EEEEEE",
                        rx:2,
                        ry:2,
                        opacity: 1
                     })
                    //182 for top
                    //197 for off
                   let sw = new fabric.Rect({
                        top: 285,
                        left: 148 - 32 * (this.getIndex() + 1),
                        width: 17, 
                        height: 15, 
                        fill: "#423F3E",
                        rx:2,
                        ry:2,
                        opacity: 1
                     })
                  /*let done_led = new fabric.Rect({
                        top: -108,
                        left: 191, 
                        width: 5, 
                        height: 8, 
                        fill: "green",
                        opacity: 1
                     }) */
                  return{objects : {sw_1, sw_2, sw/*, done_led*/}}; 
               },
               renderEach(){
                  var mod = ((('/top|fpga_switch_macro$sw'.asInt(-1) >> this.getScope("led").index) & 1) == 1);
                  this.getInitObject("sw").set(mod ? {top: 270} : {top: 285});
               }
         '],['
         m4_ifelse_block(M4_BOARD, 2,['
         /led[15:0]
            \viz_alpha
               initEach() {
                    
                  let sw_1 = new fabric.Rect({
                        top: 172,
                        left: 215 - 28 * (this.getIndex() + 1),
                        width: 22, 
                        height: 50, 
                        fill: "#7F8B52",
                        rx:2,
                        ry:2,
                        opacity: 1
                     })
                  let sw_2 = new fabric.Rect({
                        top: 182,
                        left: 220 - 28 * (this.getIndex() + 1),
                        width: 12, 
                        height: 30, 
                        fill: "#EEEEEE",
                        rx:2,
                        ry:2,
                        opacity: 1
                     })
                    //182 for top
                    //197 for off
                   let sw = new fabric.Rect({
                        top: 197,
                        left: 218 - 28 * (this.getIndex() + 1),
                        width: 17, 
                        height: 15, 
                        fill: "#423F3E",
                        rx:2,
                        ry:2,
                        opacity: 1
                     })
                  /*let done_led = new fabric.Rect({
                        top: -108,
                        left: 191, 
                        width: 5, 
                        height: 8, 
                        fill: "green",
                        opacity: 1
                     }) */
                  return{objects : {sw_1, sw_2, sw/*, done_led*/}}; 
               },
               renderEach(){
                  var mod = ((('/top|fpga_switch_macro$sw'.asInt(-1) >> this.getScope("led").index) & 1) == 1);
                  this.getInitObject("sw").set(mod ? {top: 182} : {top: 197});
               }
         '],['
         m4_ifelse_block(M4_BOARD, 3,['
         /led[15:0]
            \viz_alpha
               initEach() {
                     //172
                  let sw_1 = new fabric.Rect({
                        top: 120,
                        left: 200 - 25.8 * (this.getIndex() + 1),
                        width: 22, 
                        height: 37, 
                        fill: "#7F8B52",
                        rx:2,
                        ry:2,
                        opacity: 1
                     })
                  let sw_2 = new fabric.Rect({
                        top: 125,
                        left: 205 - 25.8 * (this.getIndex() + 1),
                        width: 12, 
                        height: 26, 
                        fill: "#EEEEEE",
                        rx:2,
                        ry:2,
                        opacity: 1
                     })
                    //182 for top
                    //197 for off
                   let sw = new fabric.Rect({
                        top: 140,
                        left: 203 - 25.8 * (this.getIndex() + 1),
                        width: 17, 
                        height: 15, 
                        fill: "#423F3E",
                        rx:2,
                        ry:2,
                        opacity: 1
                     })
                  /*let done_led = new fabric.Rect({
                        top: -108,
                        left: 191, 
                        width: 5, 
                        height: 8, 
                        fill: "green",
                        opacity: 1
                     }) */
                  return{objects : {sw_1, sw_2, sw/*, done_led*/}}; 
               },
               renderEach(){
                  var mod = ((('/top|fpga_switch_macro$sw'.asInt(-1) >> this.getScope("led").index) & 1) == 1);
                  this.getInitObject("sw").set(mod ? {top: 125} : {top: 140});
               }
         '],['
         m4_ifelse_block(M4_BOARD, 4,['
         '],['
         m4_ifelse_block(M4_BOARD, 5,['
         /led[15:0]
            \viz_alpha
               initEach() {
                     //15
                  let sw_1 = new fabric.Rect({
                        top: 150,
                        left: 185 - 22 * (this.getIndex() + 1),
                        width: 22, 
                        height: 37, 
                        fill: "#7F8B52",
                        rx:2,
                        ry:2,
                        opacity: 1
                     })
                  let sw_2 = new fabric.Rect({
                        top: 155,
                        left: 190 - 22 * (this.getIndex() + 1),
                        width: 12, 
                        height: 26, 
                        fill: "#EEEEEE",
                        rx:2,
                        ry:2,
                        opacity: 1
                     })
                    //182 for top
                    //197 for off
                   let sw = new fabric.Rect({
                        top: 170,
                        left: 188 - 22 * (this.getIndex() + 1),
                        width: 17, 
                        height: 15, 
                        fill: "#423F3E",
                        rx:2,
                        ry:2,
                        opacity: 1
                     })
                  /*let done_led = new fabric.Rect({
                        top: -108,
                        left: 191, 
                        width: 5, 
                        height: 8, 
                        fill: "green",
                        opacity: 1
                     }) */
                  return{objects : {sw_1, sw_2, sw/*, done_led*/}}; 
               },
               renderEach(){
                  var mod = ((('/top|fpga_switch_macro$sw'.asInt(-1) >> this.getScope("led").index) & 1) == 1);
                  this.getInitObject("sw").set(mod ? {top: 155} : {top: 170});
               }
         '])
         '])
         '])
         '])
         '])
         '])
\TLV fpga_push($_pb)
   |fpga_push_macro
      @0
         m4_ifelse_block(M4_MAKERCHIP, 1, ['
         $pb[\$size($_pb)-1:0] = $_pb;
         m4_ifelse_block(M4_BOARD, 1,['
         /pb[4:0]
            \viz_alpha
               initEach(){
                  let push = new fabric.Circle({
                           originX: "center",
                           originY: "center",
                           top: scopes.pb.index == 0 ? 218 : scopes.pb.index == 1 ? 292 : 254,
                           left: scopes.pb.index == 2 ? 211 : scopes.pb.index == 3 ? 307 : 259,
                           radius: 10,
                           opacity: 1,
                           fill: "red"
                        }) 
                  return {objects:{push}}
               },
               renderEach(){
                  var mod = ((('/top|fpga_push_macro$pb'.asInt(-1) >> this.getScope("pb").index) & 1) == 1);
                  if(mod){
                     this.getInitObjects().push.set({fill: "red"})
                  }else{
                     this.getInitObjects().push.set({fill: "black"})
                  }
               }
         '],['
         m4_ifelse_block(M4_BOARD, 2,['
         /pb[4:0]
            \viz_alpha
               initEach(){
                  let push = new fabric.Circle({
                           originX: "center",
                           originY: "center",
                           top: scopes.pb.index == 0 ? 40 : scopes.pb.index == 1 ? 121 : 79,
                           left: scopes.pb.index == 2 ? 113 : scopes.pb.index == 3 ? 203 : 155,
                           radius: 10,
                           opacity: 1,
                           fill: "red"
                        }) 
                  return {objects:{push}}
               },
               renderEach(){
                  var mod = ((('/top|fpga_push_macro$pb'.asInt(-1) >> this.getScope("pb").index) & 1) == 1);
                  if(mod){
                     this.getInitObjects().push.set({fill: "red"})
                  }else{
                     this.getInitObjects().push.set({fill: "black"})
                  }
               }
         '],['
         m4_ifelse_block(M4_BOARD, 3,['
         /pb[4:0]
            \viz_alpha
               initEach(){
                  let push = new fabric.Circle({
                           originX: "center",
                           originY: "center",
                           top: scopes.pb.index == 0 ? 27 : scopes.pb.index == 1 ? 81 : 54,
                           left: scopes.pb.index == 2 ? 65 : scopes.pb.index == 3 ? 130 : 98,
                           radius: 7,
                           opacity: 1,
                           fill: "red"
                        }) 
                  return {objects:{push}}
               },
               renderEach(){
                  var mod = ((('/top|fpga_push_macro$pb'.asInt(-1) >> this.getScope("pb").index) & 1) == 1);
                  if(mod){
                     this.getInitObjects().push.set({fill: "red"})
                  }else{
                     this.getInitObjects().push.set({fill: "black"})
                  }
               }
         '],['
         m4_ifelse_block(M4_BOARD, 4,['
         /pb[2:0]
            \viz_alpha
               initEach(){
                  let push = new fabric.Circle({
                           originX: "center",
                           originY: "center",
                           top: 240,
                           left: scopes.pb.index == 2 ? -175 : scopes.pb.index == 1 ? -128 : -80,
                           radius: 10,
                           opacity: 1,
                           fill: "red"
                        }) 
                  return {objects:{push}}
               },
               renderEach(){
                  var mod = ((('/top|fpga_push_macro$pb'.asInt(-1) >> this.getScope("pb").index) & 1) == 1);
                  if(mod){
                     this.getInitObjects().push.set({fill: "red"})
                  }else{
                     this.getInitObjects().push.set({fill: "black"})
                  }
               }
         '],['
         m4_ifelse_block(M4_BOARD, 5,['
         /pb[4:0]
            \viz_alpha
               initEach(){
                  let push = new fabric.Circle({
                           originX: "center",
                           originY: "center",
                           top: scopes.pb.index == 0 ? 24 : scopes.pb.index == 1 ? 84 : 54,
                           left: scopes.pb.index == 2 ? 89 : scopes.pb.index == 3 ? 150 : 120,
                           radius: 5,
                           opacity: 1,
                           fill: "red"
                        }) 
                  return {objects:{push}}
               },
               renderEach(){
                  var mod = ((('/top|fpga_push_macro$pb'.asInt(-1) >> this.getScope("pb").index) & 1) == 1);
                  if(mod){
                     this.getInitObjects().push.set({fill: "red"})
                  }else{
                     this.getInitObjects().push.set({fill: "black"})
                  }
               }
         '])
         '])
         '])
         '])
         '])
         '])
\TLV led_rgb(|_pipe, @_stage, $_dutyr, $_dutyg, $_dutyb)
   |_pipe
      @_stage
         /led[4:0]
            \viz_alpha
               initEach() {
                  let led = new fabric.Rect({
                        top: (this.getIndex() == 1) ? 166 : (this.getIndex() == 2) ? 208 : 188,
                        left: (this.getIndex() == 3) ? -112 : (this.getIndex() == 4) ?  -153 : -132,
                        width: 8, 
                        height: 7, 
                        fill: "transparent",
                        opacity: 1
                     })
                  return{objects : {led}}; 
               }, 
               renderEach() {
                     let r = '/top|_pipe$_dutyr'.asInt()
                     let g = '/top|_pipe$_dutyg'.asInt()
                     let b = '/top|_pipe$_dutyb'.asInt()
                     let value = "rgb(" + r + "," + g + "," + b + ")"
                     this.getInitObjects().led.set({fill: value})
                     //this.getInitObjects().g.set({opacity: g})
                     //this.getInitObjects().b.set({opacity: b})
                     //var mod = ((('/top|_pipe$leds'.asInt(-1) >> this.getScope("led").index) & 1) == 1);
                     //this.getInitObject("led").set(mod ? {opacity: 1} : {opacity: 0});
                  } 
  
\TLV fpga_lcd($_out, $_lcd_enable, $_lcd_reset)
   //for viz part
   |fpga_lcd_macro
      @0
         m4_ifelse_block(M4_MAKERCHIP, 1, ['
         $reset = *reset;
         $out[\$size($_out)-1:0] = $_out;
         $lcd_enable = $_lcd_enable;
         $lcd_reset = $_lcd_reset;
         // This code supports only 8 bit mode (4 bit mode not supported)
         $one_or_two[1:0] = $reset ? 0 : $out == 8'h38 ? 2 : $out == 8'h30 ? 1 : >>1$one_or_two;    // 1-line mode or 2-line mode
         $line[1:0] = $reset ? 0 : $lcd_reset == 0 ? ($out == 8'h80 | $out == 8'h01 |$out == 8'h02) & !$one_or_two == 0 ? 1 : 
                      $out == 8'hC0 & $one_or_two == 2 ? 2 :
                      $RETAIN: 
                      $RETAIN;    // assign line number
         $inc_or_dec[1:0] = $reset ? 0 : $out == 8'h06 ? 1 : 
                            $out == 8'h04 ? 2 : 
                            >>1$inc_or_dec;    // increment or decrement cursor command
         $read_enable = $lcd_enable == 1 && >>1$lcd_enable == 0;
         $shift_left[5:0] = $reset | >>1$shift_left == 40 ? 0 : 
                            ($out == 8'h18 & !$lcd_reset & $read_enable ? >>1$shift_left + 1 : 
                            $RETAIN);          // no of shift lefts
         $shift_right[5:0] = $reset | >>1$shift_right == 40 ? 0 : 
                             ($out == 8'h1C & $lcd_reset == 0 & $read_enable ? >>1$shift_right + 1 : 
                             $RETAIN);         // no of shift rights
         $wr_index1[6:0] = (($reset | $out == 8'h01 | $out == 8'h80) & $lcd_reset == 0) ? 0 : 
                             $read_enable && $line == 1 && $lcd_reset == 0 ? ($out == 8'h14 ? >>1$wr_index1 + 1 : 
                            ($out == 8'h10 ? >>1$wr_index1 - 1 : $RETAIN)) : 
                             $read_enable && $line == 1 && $lcd_reset == 1 ? ($inc_or_dec == 1 ? >>1$wr_index1 + 1 : 
                             $inc_or_dec == 2 ? >>1$wr_index1 - 1 : >>1$wr_index1) : 
                             >>1$wr_index1;    // cursor index if line 1
         $wr_index2[5:0] = (($reset | $out == 8'h01 | $out == 8'hC0) & $lcd_reset == 0) ? 0 : 
                             $read_enable && $line == 2 && $lcd_reset == 0 ? ($out == 8'h14 ? >>1$wr_index2 + 1 : 
                            ($out == 8'h10 ? >>1$wr_index2 - 1 : $RETAIN)) : 
                             $read_enable && $line == 2 && $lcd_reset == 1 ? ($inc_or_dec == 1 ? >>1$wr_index2 + 1 : 
                             $inc_or_dec == 2 ? >>1$wr_index2 - 1 : >>1$wr_index2) : 
                             >>1$wr_index2;    // cursor index if line 2
         /chars1[40-1:0]
            $char1[7:0] = |fpga_lcd_macro$out == 8'h01 & |fpga_lcd_macro$lcd_reset == 0 ? 8'h20 : 
                          |fpga_lcd_macro>>1$wr_index1 == #chars1 && |fpga_lcd_macro$line == 1 && |fpga_lcd_macro$read_enable && |fpga_lcd_macro$lcd_reset == 1 ? |fpga_lcd_macro$out : 
                          $RETAIN;
         /chars2[40-1:0]
            $char2[7:0] = |fpga_lcd_macro$out == 8'h01 & |fpga_lcd_macro$lcd_reset == 0 ? 8'h20 : 
                          ((|fpga_lcd_macro>>1$wr_index2 == #chars2 && |fpga_lcd_macro$line == 2) | (|fpga_lcd_macro>>1$wr_index1 - 40 == #chars2 && |fpga_lcd_macro$line == 1)) && |fpga_lcd_macro$read_enable && |fpga_lcd_macro$lcd_reset == 1 ? |fpga_lcd_macro$out : 
                          $RETAIN;
         $str1[8*16-1:0] = (/chars1[*]$char1 >> 8*$shift_left) << 8*$shift_right;
         $str2[8*16-1:0] = (/chars2[*]$char2 >> 8*$shift_left) << 8*$shift_right;
         \viz_alpha
            initEach() {
                  let block_square = new fabric.Rect(
                     {originX: "center",
                      originY: "center",
                      fill : "transparent"
                     }
                  )
                  let logic_block = new fabric.Group([block_square],
                  {originX: "center",
                   originY: "center",
                  })
                  let lcd_img_url = "https://user-images.githubusercontent.com/64545984/130668318-5d9c4c9a-d19e-4ddf-aa61-13e4e8624f9c.png"
                  let lcd_img = new fabric.Image.fromURL(
                        lcd_img_url,
                        function (img) {
                           logic_block.add(img)
                           global.canvas.renderAll()
                        },
                        {originX: "center",
                         originY: "center",
                         left: -35,
                         top: 320,
                         scaleX: 0.2,
                         scaleY: 0.2,
                         angle: 0.4
                        }
                     )
                    let lcd = new fabric.Rect({
                        top: 280,
                        left: -165,
                        width: 295,
                        height: 80,
                        fill: "#FDFF32",
                        opacity: 1
                     })
                     let line1 = new fabric.Text("", {
                       left: -160,
                       top: 290,
                       fontSize: 30,
                       fontFamily: "Courier New",
                     })
                     let line2 = new fabric.Text("", {
                       left: -160,
                       top: 320,
                       fontSize: 30,
                       fontFamily: "Courier New",
                     })
                     let info = new fabric.Text("", {
                       left: -300,
                       top: -250,
                       fontSize: 15,
                       fontFamily: "Courier New",
                     })
                return {objects :{logic_block, lcd, line1, line2, info}};
                },
             renderEach(){
                 let str1 = '/top|fpga_lcd_macro$str1'.asString().split("").reverse().join("")
                 let str2 = '/top|fpga_lcd_macro$str2'.asString().split("").reverse().join("")
                 let lcd_rst = '/top|fpga_lcd_macro$lcd_reset'.asBool()
                 this.getInitObjects().line1.setText(str1)
                 this.getInitObjects().line2.setText(str2)
                 let value_bin = '/top|fpga_lcd_macro$out'.asBinaryStr();
                 if(!lcd_rst){
                 if (value_bin == "00111000"){
                    //8'h38
                    //Function Set: 8-bit, 2 Line, 5x7 Dots
                    this.getInitObjects().info.setText("Function Set: 8-bit, 2 Line, 5x7 Dots")
                 }else if (value_bin == "00110000"){
                    //Function Set: 8-bit,  Line, 5x7 Dots
                    //8'h30
                    this.getInitObjects().info.setText("Function Set: 8-bit, 1 Line, 5x7 Dots")
                 }else if (value_bin == "00001100"){
                    //Display on Cursor off
                    //8'h0C
                    this.getInitObjects().info.setText("Display on Cursor off")
                 }else if (value_bin == "00000110"){
                    //Entry Mode
                    //8'h06
                    this.getInitObjects().info.setText("Entry Mode: Increment, entire shift off")
                 }else if (value_bin == "00000100"){
                    //Entry Mode
                    //8'h04
                    this.getInitObjects().info.setText("Entry Mode: Decrement, entire shift off")
                 }else if (value_bin == "00000001"){
                    //Clear Display
                    //8'h01
                    this.getInitObjects().info.setText("Clear Display")
                 }else if (value_bin == "00000010"){
                    //Return home
                    //8'h02
                    this.getInitObjects().info.setText("Return home")
                 }else if (value_bin == "10000000"){
                    //force cursor to begin at first line
                    //8'h80
                    this.getInitObjects().info.setText("force cursor to begin at first line")
                 }else if (value_bin == "11000000"){
                    //force cursor to begin at second line
                    //8'hC0
                    this.getInitObjects().info.setText("force cursor to begin at second line")
                 }else if (value_bin == "00011000"){
                    //Shift display left
                    //8'h18
                    this.getInitObjects().info.setText("Shift entire display to the left")
                 }else if (value_bin == "00011100"){
                    //Shift display right
                    //8'h1C
                    this.getInitObjects().info.setText("Shift entire display to the right")
                 }else if (value_bin == "00010000"){
                    //Shift cursor left 
                    //8'h10
                    this.getInitObjects().info.setText("Shift cursor to the left")
                 }else if (value_bin == "00010100"){
                    //Shift cursor right
                    //8'h14
                    this.getInitObjects().info.setText("Shift cursor to the right")
                 }
              }else {
                 this.getInitObjects().info.setText("data instruction")
              }
             }
          
         '],
         ['
         ']
         )
\TLV fpga_vga($_vga_hsync, $_vga_vsync, $_vga_r, $_vga_g, $_vga_b, $_sx, $_sy)
   |vga_pipe_macro
      @0
         m4_ifelse_block(M4_MAKERCHIP, 1,['
         $reset = *reset;
         $vga_hsync = $_vga_hsync;
         $vga_vsync = $_vga_vsync;
         $vga_r[\$size($_vga_r)-1:0] = $_vga_r;
         $vga_g[\$size($_vga_g)-1:0] = $_vga_g;
         $vga_b[\$size($_vga_b)-1:0] = $_vga_b;
         $sx[\$size($_sx)-1:0] = $_sx;
         $sy[\$size($_sy)-1:0] = $_sy;
         m4_define(M4_MAX_H, 640 / M4_COUNTER)
         m4_define(M4_MAX_V, 480 / M4_COUNTER)
         $hori_counter[9:0] = $reset ? 10'b0 : >>1$sx >= M4_LINE ? 0 : >>1$hori_counter + 1;
         $vert_counter[9:0] = $reset ? 10'b0 : $sy == 0 ? 0 : >>1$sx >=  M4_LINE ? >>1$vert_counter + 1 : $RETAIN;
         $width[9:0] = (800 % M4_COUNTER) > 0 ? 800 / M4_COUNTER + 2 : 800 / M4_COUNTER + 1;
         $height[9:0] = (525 % M4_COUNTER) > 0 ? 525 / M4_COUNTER + 2 : 525 / M4_COUNTER + 1;
         $tot_cyc[19:0] = $width * $height;
         *passed = !clk || *cyc_cnt > ($tot_cyc * M4_FRAMES) - 1;
         *failed = !clk || 1'b0;
         \viz_alpha
            initEach(){
            // https://www.google.com/search?q=monitor&tbm=isch&tbs=il:cl&client=ubuntu&hs=JlM&hl=en&sa=X&ved=0CAAQ1vwEahcKEwjgkNDes_DxAhUAAAAAHQAAAAAQAg&biw=1846&bih=978#imgrc=q9qZvDIpiEqJBM
                  let monitor_img_url = "https://user-images.githubusercontent.com/64545984/130668406-24040e0c-cdff-4672-8818-bbb84d8041a5.png"
                  let monitor_img = new fabric.Image.fromURL(
                        monitor_img_url,
                        function (img) {
                           global.canvas.add(img)
                           global.canvas.renderAll()
                        },
                        {originX: "center",
                         originY: "center",
                         left: 216,
                         top: -150,
                         scaleX: 0.606,
                         scaleY: 0.72,
                         angle: 0
                        }
                     )
               let frame = new fabric.Text("", {
                 left: -330,
                 top: -300,
                 fontSize: 20,
                 fontFamily: "Courier New",
               })
               let hsync = new fabric.Text("hsync:", {
                 left: -200,
                 top: -300,
                 fontSize: 20,
                 fontFamily: "Courier New",
               })
               let vsync = new fabric.Text("vsync:", {
                 left: -80,
                 top: -300,
                 fontSize: 20,
                 fontFamily: "Courier New",
               })
               let row_pointer = new fabric.Text("->", {
                     top: -270,
                     left: 75,
                     fill: "black",
                     fontSize: 14,
                     fontFamily: "monospace"
                  })
               let column_pointer = new fabric.Text("->", {
                     top: - 300,
                     left: 110,
                     fill: "black",
                     angle: 90,
                     fontSize: 14,
                     fontFamily: "monospace"
                  })
               return {objects: {frame, hsync, vsync, row_pointer, column_pointer}}
            },
            renderEach(){
               let hori_cnt_now = '/top|vga_pipe_macro$hori_counter'.asInt() - 1
               let vert_cnt_now = '/top|vga_pipe_macro$vert_counter'.asInt()
               let vga_hsync = '/top|vga_pipe_macro$vga_hsync'.asInt()
               let vga_vsync = '/top|vga_pipe_macro$vga_vsync'.asInt()
               let width = '/top|vga_pipe_macro$width'.asInt()
               let height = '/top|vga_pipe_macro$height'.asInt()
               let cycle = '/top|vga_pipe_macro$hori_counter'.getCycle()
               let count = '/top|vga_pipe_macro$tot_cyc'.asInt()
               let frame = parseInt(cycle / count)
               console.log("hori", hori_cnt_now)
               let sq_width = Math.sqrt(40000 / (M4_MAX_H * M4_MAX_V))
               this.getInitObjects().frame.setText("Frame: " + (frame + 1))
               this.getInitObjects().hsync.setText("hsync: " + vga_hsync)
               this.getInitObjects().vsync.setText("vsync: " + vga_vsync)
               if (vert_cnt_now < M4_MAX_V){
               this.getInitObjects().row_pointer.set({top:-270 + (sq_width * vert_cnt_now), opacity : 1})
               }else{
               this.getInitObjects().column_pointer.set({opacity : 0})
               }
               if (hori_cnt_now < M4_MAX_H){
               this.getInitObjects().column_pointer.set({left:110 + (sq_width * hori_cnt_now), opacity: 1})
               }else{
               this.getInitObjects().column_pointer.set({opacity : 0})
               }
               for(j=0; j<M4_MAX_H; j++){
                   for(k=0; k<M4_MAX_V; k++){
                      let grid = new fabric.Rect({
                      top: (sq_width * k) - 269,
                      left: (sq_width * j) + 100,
                      width: sq_width,
                      height: sq_width,
                      fill:"black"
                   })
                   i = k * width + j
                   if(frame){
                     let red = '/top|vga_pipe_macro$vga_r'.goTo(((frame-1) * count)+i).asBinaryStr()
                     red = red.concat(red)
                     red = parseInt(red, 2);
                     let green = '/top|vga_pipe_macro$vga_g'.goTo(((frame-1) * count)+i).asBinaryStr()
                     green = green.concat(green)
                     green = parseInt(green, 2);
                     let blue = '/top|vga_pipe_macro$vga_b'.goTo(((frame-1) * count)+i).asBinaryStr()
                     blue = blue.concat(blue)
                     blue = parseInt(blue, 2);
                     let color = "rgb(" + red + "," + green + "," + blue + ")"
                     grid.set({fill:color, stroke:color, strokeWidth:1})
                   }
                     let red = '/top|vga_pipe_macro$vga_r'.goTo(((frame) * count) + i).asBinaryStr()
                     red = red.concat(red)
                     red = parseInt(red, 2);
                     let green = '/top|vga_pipe_macro$vga_g'.goTo(((frame) * count) + i).asBinaryStr()
                     green = green.concat(green)
                     green = parseInt(green, 2);
                     let blue = '/top|vga_pipe_macro$vga_b'.goTo(((frame) * count) + i).asBinaryStr()
                     blue = blue.concat(blue)
                     blue = parseInt(blue, 2);
                     color = "rgb(" + red + "," + green + "," + blue + ")"
                   if(k<vert_cnt_now){
                     grid.set({fill:color, stroke:color, strokeWidth:1})
                   }else if(k==vert_cnt_now){
                      if(j<=hori_cnt_now){
                         grid.set({fill:color, stroke:color, strokeWidth:1})
                      }
                   }
                   global.canvas.add(grid)
                   }
                }
            }
         ']
         )
