package _477
{
   import _11111._11110;
   import _1315._1319;
   import _1404._1407;
   import _586._596;
   import _721._720;
   import _97._118;
   import flash.display.BitmapData;
   import flash.display.JPEGEncoderOptions;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   
   public class ExportImageFileByFrameIndex extends _494
   {
      private var _3684:Number;
      
      private var _3685:Number;
      
      private var _width:Number;
      
      private var _height:Number;
      
      private var _3688:Number;
      
      private var _3687:Number;
      
      private var _3686:String;
      
      private var _13269:Boolean;
      
      private var _14488:int;
      
      public function ExportImageFileByFrameIndex(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:String, param8:Boolean = false, param9:int = 0)
      {
         super();
         this._3684 = param1;
         this._3686 = param7;
         this._3685 = param2;
         this._width = param3;
         this._height = param4;
         this._3688 = param5;
         this._3687 = param6;
         this._13269 = param8;
         this._14488 = (param9 + "").length;
      }
      
      override public function run() : void
      {
         var rawImageObj:Object = null;
         var m:Matrix = null;
         var smoothing:Boolean = false;
         var bmpD:BitmapData = null;
         var path:String = null;
         var imageData:ByteArray = null;
         var pngEncoder:_1319 = null;
         try
         {
            rawImageObj = this._3443._3681(this._3685,true);
            m = new Matrix();
            m.tx = this._3688 + rawImageObj.povitX;
            m.ty = this._3687 + rawImageObj.povitY;
            smoothing = _3238.scale != 1;
            if(smoothing)
            {
               this._width *= _3238.scale;
               this._height *= _3238.scale;
               m.scale(_3238.scale,_3238.scale);
            }
            if(this._width < 1)
            {
               this._width = 1;
            }
            if(this._height < 1)
            {
               this._height = 1;
            }
            if(_3238.imageFormat == _720.IMAGES_FORMAT_PNG)
            {
               if(_3238.hasBackground)
               {
                  bmpD = new BitmapData(this._width,this._height,false,_3238.backgroundColor);
               }
               else
               {
                  bmpD = new BitmapData(this._width,this._height,true,0);
               }
            }
            else
            {
               bmpD = new BitmapData(this._width,this._height,false,_3238.backgroundColor);
            }
            if(rawImageObj.bitmapData)
            {
               bmpD.draw(rawImageObj.bitmapData,m,null,null,null,smoothing);
            }
            if(this._13269)
            {
               path = _3613.ouputPath + this._3686 + (this._3684 >= 0 ? "_" + (this._3684 + 1) : "");
            }
            else
            {
               path = _3613.ouputPath + this._3686 + (this._3684 >= 0 ? "_" + this._14487(this._3684) : "");
            }
            if(_3238.imageFormat == _720.IMAGES_FORMAT_JPG)
            {
               imageData = bmpD.encode(new Rectangle(0,0,bmpD.width,bmpD.height),new JPEGEncoderOptions(100));
               path += ".jpg";
            }
            else
            {
               pngEncoder = new _1319();
               imageData = pngEncoder.encode(bmpD);
               path += ".png";
            }
            bmpD.dispose();
            bmpD = null;
            _118.save(path,imageData,true,"",false,this._3682,this._3683);
         }
         catch(e:Error)
         {
            _11110.instance._11204._11132("ExportImageFileByFrameIndex::run",e);
            fail(ExportController.EXPORT_OUT_MEMORY);
            return;
         }
      }
      
      private function _14487(param1:int) : String
      {
         var _loc2_:Array = String(param1).split("");
         var _loc3_:int = 0;
         while(_loc3_ < this._14488)
         {
            if(_loc3_ > _loc2_.length - 1)
            {
               _loc2_.splice(0,0,"0");
            }
            _loc3_++;
         }
         return _loc2_.join("");
      }
      
      private function _3683() : void
      {
         fail(ExportController.EXPORT_ERROR_SAVE_FILE,null);
      }
      
      private function _3682() : void
      {
         complete();
      }
      
      private function get _3443() : _596
      {
         return _1407.getInstance(_596) as _596;
      }
   }
}

