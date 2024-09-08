package _880
{
   import _658.Mesh;
   import com.adobe.utils.AGALMiniAssembler;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.display.Stage3D;
   import flash.display.StageQuality;
   import flash.display3D.Context3D;
   import flash.display3D.Context3DBlendFactor;
   import flash.display3D.Context3DProgramType;
   import flash.display3D.Context3DRenderMode;
   import flash.display3D.Context3DTextureFormat;
   import flash.display3D.Context3DVertexBufferFormat;
   import flash.display3D.IndexBuffer3D;
   import flash.display3D.Program3D;
   import flash.display3D.VertexBuffer3D;
   import flash.display3D.textures.RectangleTexture;
   import flash.display3D.textures.Texture;
   import flash.display3D.textures.TextureBase;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Matrix3D;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.system.Capabilities;
   import flash.utils.setTimeout;
   
   public class _879
   {
      private static var _instance:_879;
      
      public static var ready:Boolean;
      
      public static const MIN_SIZE:int = 32;
      
      public static const MAX_SIZE:int = 4096;
      
      public static const NONE:String = "none";
      
      public static const BILINEAR:String = "bilinear";
      
      public static const TRILINEAR:String = "trilinear";
      
      public static const ORIGIN_POINT:Point = new Point();
      
      private static var _6442:AGALMiniAssembler = new AGALMiniAssembler();
      
      private var _stage:Stage;
      
      private var _6449:Stage3D;
      
      private var _6450:String;
      
      private var _renderMode:String = "software";
      
      private var _context:Context3D;
      
      private var _6424:Boolean = true;
      
      private var _6446:Rectangle;
      
      private var _6432:int = 16;
      
      private var _texture:TextureBase;
      
      private var _6443:String = "bilinear";
      
      private var _6438:uint = 999999;
      
      private var _6427:Object;
      
      private var _6433:VertexBuffer3D;
      
      private var _6437:IndexBuffer3D;
      
      private var _6440:Boolean;
      
      private var _6451:String;
      
      private var _6452:Boolean;
      
      private var _6436:Matrix3D;
      
      public function _879(param1:Stage, param2:String = "auto")
      {
         super();
         this._stage = param1;
         this._6449 = param1.stage3Ds[0];
         this._6450 = param2;
         this._6427 = {};
         this._6449.addEventListener(Event.CONTEXT3D_CREATE,this._6428,false,10,true);
         this._6449.addEventListener(ErrorEvent.ERROR,this._6430,false,10,true);
         if(Boolean(this._6449.context3D) && this._6449.context3D.driverInfo != "Disposed")
         {
            if(param2 == "auto" || param2 is Array)
            {
               throw new ArgumentError("When sharing the context3D, " + "the actual profile has to be supplied");
            }
            this._6450 = "profile" in this._6449.context3D ? this._6449.context3D["profile"] : param2 as String;
            setTimeout(this.initialize,1);
         }
         else
         {
            this.requestContext3D(this._6449,this._renderMode,param2);
         }
      }
      
      public static function init(param1:Stage, param2:String = "auto") : void
      {
         _instance = new _879(param1,param2);
      }
      
      public static function get instance() : _879
      {
         return _instance;
      }
      
      public function set smoothing(param1:String) : void
      {
         this._6443 = param1;
      }
      
      public function set _6435(param1:int) : void
      {
         this._6432 = param1;
      }
      
      public function dispose() : void
      {
         this._6449.removeEventListener(Event.CONTEXT3D_CREATE,this._6428,false);
         this._6449.removeEventListener(ErrorEvent.ERROR,this._6430,false);
         if(this._context)
         {
            this._context.dispose(false);
         }
      }
      
      private function requestContext3D(param1:Stage3D, param2:String, param3:Object) : void
      {
         var profiles:Array = null;
         var currentProfile:String = null;
         var requestNextProfile:Function = null;
         var _6447:Function = null;
         var onError:Function = null;
         var stage3D:Stage3D = param1;
         var renderMode:String = param2;
         var profile:Object = param3;
         requestNextProfile = function():void
         {
            currentProfile = profiles.shift();
            try
            {
               _6449.requestContext3D(renderMode,currentProfile);
            }
            catch(error:Error)
            {
               if(profiles.length == 0)
               {
                  throw error;
               }
               setTimeout(requestNextProfile,1);
            }
         };
         _6447 = function(param1:Event):void
         {
            var _loc2_:Context3D = stage3D.context3D;
            if(renderMode == Context3DRenderMode.AUTO && profiles.length != 0 && _loc2_.driverInfo.indexOf("Software") != -1)
            {
               onError(param1);
            }
            else
            {
               _6450 = currentProfile;
               onFinished();
            }
         };
         onError = function(param1:Event):void
         {
            if(profiles.length != 0)
            {
               param1.stopImmediatePropagation();
               setTimeout(requestNextProfile,1);
            }
            else
            {
               onFinished();
            }
         };
         var onFinished:Function = function():void
         {
            _6449.removeEventListener(Event.CONTEXT3D_CREATE,_6447);
            _6449.removeEventListener(ErrorEvent.ERROR,onError);
         };
         if(profile == "auto")
         {
            profiles = ["standardExtended","standard","standardConstrained","baselineExtended","baseline","baselineConstrained"];
         }
         else if(profile is String)
         {
            profiles = [profile as String];
         }
         else
         {
            if(!(profile is Array))
            {
               throw new ArgumentError("Profile must be of type \'String\' or \'Array\'");
            }
            profiles = profile as Array;
         }
         this._6449.addEventListener(Event.CONTEXT3D_CREATE,_6447,false,100);
         this._6449.addEventListener(ErrorEvent.ERROR,onError,false,100);
         requestNextProfile();
      }
      
      private function _6430(param1:ErrorEvent) : void
      {
         var _loc2_:String = null;
         if(param1.errorID == 3702)
         {
            _loc2_ = Capabilities.playerType == "Desktop" ? "renderMode" : "wmode";
         }
      }
      
      private function _6428(param1:Event) : void
      {
         this.initialize();
      }
      
      private function initialize() : void
      {
         this._6423();
         ready = true;
         this._stage.dispatchEvent(new Event("GPU_READY"));
      }
      
      private function _6423() : void
      {
         this._context = this._6449.context3D;
         this._context.enableErrorChecking = this._6424;
      }
      
      private function _6431(param1:Number, param2:Number) : void
      {
         if(this._6446 == null)
         {
            this._6446 = new Rectangle(0,0,param1,param2);
         }
         else
         {
            this._6446.setTo(0,0,param1,param2);
         }
         this.configureBackBuffer(this._6446.width,this._6446.height,this._6432,false);
      }
      
      public function _6425(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         this._6431(param1,param2);
         this._6436 = new Matrix3D();
         this._6436.appendTranslation(param3,param4,0);
         this._6436.appendScale(2 / param1,-2 / param2,1);
         this._6436.appendTranslation(-1,1,0);
      }
      
      private function configureBackBuffer(param1:int, param2:int, param3:int, param4:Boolean, param5:Boolean = false) : void
      {
         this._context.configureBackBuffer(param1,param2,param3,param4,param5);
      }
      
      public function _5738(param1:Number, param2:Number, param3:Number, param4:Number, param5:Mesh, param6:BitmapData = null) : void
      {
         this._14763(param1,param2,param3,param4,param5,param6);
      }
      
      private function _14763(param1:Number, param2:Number, param3:Number, param4:Number, param5:Mesh, param6:BitmapData = null) : void
      {
         var _loc9_:Matrix = null;
         var _loc7_:Sprite = new Sprite();
         var _loc8_:Graphics;
         (_loc8_ = _loc7_.graphics).beginBitmapFill(param5._1854,null,false,true);
         _loc8_.drawTriangles(param5._14663,Vector.<int>(param5._2709),param5._14668);
         _loc8_.endFill();
         if(param6)
         {
            param6.fillRect(new Rectangle(0,0,param1,param2),0);
            (_loc9_ = new Matrix()).tx = param3;
            _loc9_.ty = param4;
            param6.drawWithQuality(_loc7_,_loc9_,null,null,null,true,StageQuality.BEST);
         }
      }
      
      private function _14764(param1:Number, param2:Number, param3:Number, param4:Number, param5:Mesh, param6:BitmapData = null) : void
      {
         this._6425(param1,param2,param3,param4);
         this._context.clear(0,0,0,0);
         this._context.setBlendFactors(Context3DBlendFactor.ONE,Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA);
         if(param5._2709.length <= 0)
         {
            return;
         }
         var _loc7_:Vector.<Number> = param5._5746;
         this._context.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX,1,this._6436,true);
         this._context.setProgramConstantsFromVector(Context3DProgramType.VERTEX,0,_loc7_);
         if(this._texture)
         {
            this._texture.dispose();
         }
         this._texture = this._6445(param5._1854,param5._1854.width,param5._1854.height);
         var _loc8_:Vector.<Number> = param5._2708;
         var _loc9_:int = _loc8_.length / 4;
         this._6433 = this._context.createVertexBuffer(_loc9_,4);
         this._6433.uploadFromVector(_loc8_,0,_loc9_);
         var _loc10_:Vector.<uint> = param5._2709;
         var _loc11_:int;
         var _loc12_:int = (_loc11_ = int(_loc10_.length)) / 3;
         this._6437 = this._context.createIndexBuffer(_loc11_);
         this._6437.uploadFromVector(_loc10_,0,_loc11_);
         this._context.setVertexBufferAt(0,this._6433,0,Context3DVertexBufferFormat.FLOAT_2);
         this._context.setVertexBufferAt(2,this._6433,2,Context3DVertexBufferFormat.FLOAT_2);
         this.setProgram(this._context);
         this._context.setTextureAt(0,this._texture);
         this._context.drawTriangles(this._6437,0,_loc12_);
         if(param6 != null)
         {
            this._context.drawToBitmapData(param6);
         }
         else
         {
            this._context.present();
         }
      }
      
      private function setProgram(param1:Context3D) : void
      {
         var _loc5_:* = null;
         var _loc6_:String = null;
         var _loc7_:* = null;
         var _loc2_:uint = 0;
         if(this._6440)
         {
            _loc2_ |= 1 << 1;
         }
         if(this._6452)
         {
            _loc2_ |= 1 << 2;
         }
         if(this._6443 != BILINEAR)
         {
            _loc2_ |= 1 << (this._6443 == TRILINEAR ? 3 : 4);
         }
         if(this._6451 != Context3DTextureFormat.BGRA)
         {
            _loc2_ |= 1 << (this._6451 == "compressedAlpha" ? 5 : 6);
         }
         if(_loc2_ == this._6438)
         {
            return;
         }
         this._6438 = _loc2_;
         var _loc3_:String = this._6427[_loc2_];
         if(_loc3_ == null)
         {
            _loc3_ = "PB_i." + _loc2_.toString(16);
            this._6427[_loc2_] = _loc3_;
         }
         var _loc4_:Program3D = this._6444(_loc3_);
         if(!_loc4_)
         {
            _loc5_ = "m44 op, va0, vc1 \n" + "mov v0, vc0 \n" + "mov v1, va2 \n";
            _loc6_ = this._6422(this._6451,this._6440,this._6452,this._6443);
            _loc7_ = "tex ft1, v1, fs0, " + _loc6_ + " \n" + "mul oc, ft1, v0 \n";
            _loc4_ = this._6421(_loc3_,_loc5_,_loc7_);
         }
         this._context.setProgram(_loc4_);
      }
      
      private function _6444(param1:String) : Program3D
      {
         return this._6427[param1];
      }
      
      private function _6421(param1:String, param2:String, param3:String) : Program3D
      {
         var _loc4_:Program3D = null;
         _loc4_ = this._context.createProgram();
         _loc4_.upload(_6442.assemble(Context3DProgramType.VERTEX,param2),_6442.assemble(Context3DProgramType.FRAGMENT,param3));
         this._6427[param1] = _loc4_;
         return _loc4_;
      }
      
      private function _6422(param1:String, param2:Boolean, param3:Boolean = false, param4:String = "bilinear") : String
      {
         var _loc5_:Array = ["2d",param3 ? "repeat" : "clamp"];
         if(param1 == Context3DTextureFormat.COMPRESSED)
         {
            _loc5_.push("dxt1");
         }
         else if(param1 == "compressedAlpha")
         {
            _loc5_.push("dxt5");
         }
         if(param4 == NONE)
         {
            _loc5_.push("nearest",param2 ? "mipnearest" : "mipnone");
         }
         else if(param4 == BILINEAR)
         {
            _loc5_.push("linear",param2 ? "mipnearest" : "mipnone");
         }
         else if(param4 == TRILINEAR)
         {
            _loc5_.push("trilinear",param2 ? "mipnearest" : "mipnone");
         }
         else
         {
            _loc5_.push("linear",param2 ? "miplinear" : "mipnone");
         }
         return "<" + _loc5_.join(",") + ">";
      }
      
      private function _6445(param1:BitmapData, param2:Number, param3:Number, param4:Boolean = true, param5:Boolean = false, param6:Boolean = false, param7:Number = -1, param8:String = "bgra", param9:Boolean = false) : TextureBase
      {
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:TextureBase = null;
         var _loc17_:BitmapData = null;
         var _loc18_:Matrix = null;
         this._6440 = param5;
         this._6451 = param8;
         this._6452 = param9;
         param7 = 1;
         var _loc13_:Context3D = this._context;
         if(_loc13_ == null)
         {
            throw new Error("no context3D");
         }
         var _loc14_:Number = param2 * param7;
         var _loc15_:Number = param3 * param7;
         var _loc16_:Boolean = !param5 && !param9 && this._6450 != "baselineConstrained" && "createRectangleTexture" in this._context && param8.indexOf("compressed") == -1;
         if(_loc16_)
         {
            _loc10_ = Math.ceil(_loc14_ - 1e-9);
            _loc11_ = Math.ceil(_loc15_ - 1e-9);
            _loc12_ = _loc13_.createRectangleTexture(_loc10_,_loc11_,param8,param6);
            this._6429(param1,_loc12_);
         }
         else
         {
            _loc10_ = this._6426(_loc14_);
            _loc11_ = this._6426(_loc15_);
            _loc12_ = _loc13_.createTexture(_loc10_,_loc11_,param8,param6);
            if(param1.width != _loc10_ || param1.height != _loc11_)
            {
               _loc17_ = new BitmapData(_loc10_,_loc11_,true,0);
               _loc18_ = new Matrix();
               _loc18_.scale(_loc10_ / param1.width,_loc11_ / param1.height);
               _loc17_.draw(param1,_loc18_,null,null,null,true);
               this._6429(_loc17_,_loc12_);
               _loc17_.dispose();
               _loc17_ = null;
            }
            else
            {
               this._6429(param1,_loc12_);
            }
         }
         return _loc12_;
      }
      
      private function _6429(param1:BitmapData, param2:TextureBase) : void
      {
         var _loc3_:BitmapData = null;
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:int = 0;
         var _loc8_:BitmapData = null;
         var _loc9_:Matrix = null;
         var _loc10_:Rectangle = null;
         var _loc4_:TextureBase = param2;
         if(_loc4_ is Texture)
         {
            (_loc4_ as Texture).uploadFromBitmapData(param1);
         }
         else if(_loc4_ is RectangleTexture)
         {
            (_loc4_ as RectangleTexture).uploadFromBitmapData(param1);
         }
         if(this._6440 && param1.width > 1 && param1.height > 1 && _loc4_ is Texture)
         {
            _loc5_ = param1.width >> 1;
            _loc6_ = param1.height >> 1;
            _loc7_ = 1;
            _loc8_ = new BitmapData(_loc5_,_loc6_,true,0);
            _loc9_ = new Matrix(0.5,0,0,0.5);
            _loc10_ = new Rectangle();
            while(_loc5_ >= 1 || _loc6_ >= 1)
            {
               _loc10_.width = _loc5_;
               _loc10_.height = _loc6_;
               _loc8_.fillRect(_loc10_,0);
               _loc8_.draw(param1,_loc9_,null,null,null,true);
               (_loc4_ as Texture).uploadFromBitmapData(_loc8_,_loc7_++);
               _loc9_.scale(0.5,0.5);
               _loc5_ >>= 1;
               _loc6_ >>= 1;
            }
            _loc8_.dispose();
         }
      }
      
      private function _6426(param1:Number) : int
      {
         var _loc2_:* = 0;
         if(param1 is int && param1 > 0 && (param1 & param1 - 1) == 0)
         {
            return param1;
         }
         _loc2_ = 1;
         param1 -= 1e-9;
         while(_loc2_ < param1)
         {
            _loc2_ <<= 1;
         }
         return _loc2_;
      }
   }
}

