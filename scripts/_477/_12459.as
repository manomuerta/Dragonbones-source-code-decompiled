package _477
{
   import _11111._11110;
   import _1315._1319;
   import _13503._13502;
   import _1404._1407;
   import _51._50;
   import _586._596;
   import _721._720;
   import _97._118;
   import flash.display.BitmapData;
   import flash.display.JPEGEncoderOptions;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   
   public class _12459 extends _494
   {
      private var _3605:String;
      
      private var _3607:String;
      
      private var _3684:int;
      
      public function _12459(param1:String, param2:String, param3:int)
      {
         super();
         this._3605 = param2;
         this._3607 = param1;
         this._3684 = param3;
      }
      
      override public function run() : void
      {
         var _1992:_13502 = null;
         var totalFrame:int = 0;
         var o:Object = null;
         var framesData:Array = [];
         var _1886:_50 = _3238.dragonBonesVO._2107(this._3607);
         var rateScale:Number = 1;
         if(_1886)
         {
            _1992 = _1886._13656(this._3605);
            if(_1992)
            {
               this._3443._3606(_1886);
               this._3443._3604(_1992);
               _1992._1874();
               if(_3238.exportFrameRate <= 0)
               {
                  rateScale = 1;
               }
               else
               {
                  rateScale = _3238.exportFrameRate / _1992.frameRate;
               }
               totalFrame = _1992.duration;
               totalFrame = Math.ceil(totalFrame * rateScale);
               if(totalFrame == 0)
               {
                  totalFrame = 1;
               }
            }
            else
            {
               this._3443._3606(_1886);
               this._3443._3604(null);
            }
            try
            {
               o = this._3443._3681(this._3684,true,_3238._13268);
            }
            catch(e:Error)
            {
               _11110.instance._11204._11132("RenderAnimationFramesTask::run",e);
               fail(ExportController.EXPORT_OUT_MEMORY);
               return;
            }
            o.name = this._3607 + this._3605 != null ? "_" + this._3605 + "_" + this._3684 : "";
            o.frame = this._3684;
            framesData.push(o);
            if(_3613._3614[this._3607] == null)
            {
               _3613._3614[this._3607] = {};
            }
            _3613._3614[this._3607][_495.SINGLE_FLAG] = framesData;
            if(_1992)
            {
               _1992._1868();
            }
            complete();
         }
         else
         {
            fail(ExportController.EXPORT_ERROR_UNKNOW,null);
         }
      }
      
      private function saveFile(param1:BitmapData) : void
      {
         var _loc3_:ByteArray = null;
         var _loc4_:_1319 = null;
         if(param1 == null)
         {
            this._3683();
            return;
         }
         var _loc2_:* = _3613.ouputPath + this._3607 + "_" + this._3605 + "_" + this._3684;
         if(_3238.imageFormat == _720.IMAGES_FORMAT_JPG)
         {
            _loc3_ = param1.encode(new Rectangle(0,0,param1.width,param1.height),new JPEGEncoderOptions(100));
            _loc2_ += ".jpg";
         }
         else
         {
            _loc4_ = new _1319();
            _loc3_ = _loc4_.encode(param1);
            _loc2_ += ".png";
         }
         param1.dispose();
         param1 = null;
         _118.save(_loc2_,_loc3_,true,"",false,this._3682,this._3683);
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

