package _477
{
   import _11111._11110;
   import _1315._1319;
   import _1404._1407;
   import _586._596;
   import _721._720;
   import _97._118;
   import egret.utils.FileUtil;
   import flash.display.BitmapData;
   import flash.display.JPEGEncoderOptions;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   
   public class SaveAnimationSingleFrameTask extends _494
   {
      private var _3605:String;
      
      private var _3607:String;
      
      private var _3684:int;
      
      private var _13269:Boolean;
      
      public function SaveAnimationSingleFrameTask(param1:String, param2:String, param3:int, param4:Boolean = false)
      {
         super();
         this._3605 = param2;
         this._3607 = param1;
         this._3684 = param3;
         this._13269 = param4;
      }
      
      override public function run() : void
      {
         var bmp:BitmapData = null;
         var width:int = 0;
         var height:int = 0;
         var nbmp:BitmapData = null;
         var m:Matrix = null;
         try
         {
            if(_3613 && _3613._3614 && Boolean(_3613._3614[this._3607]) && Boolean(_3613._3614[this._3607][_495.SINGLE_FLAG]) && Boolean(_3613._3614[this._3607][_495.SINGLE_FLAG][0]))
            {
               bmp = _3613._3614[this._3607][_495.SINGLE_FLAG][0].bitmapData;
               if(bmp)
               {
                  width = bmp.width;
                  height = bmp.height;
                  width *= _3238.scale;
                  height *= _3238.scale;
                  if(!_3238.hasBackground && _3238.scale == 1)
                  {
                     nbmp = bmp;
                  }
                  else
                  {
                     nbmp = new BitmapData(width,height,!_3238.hasBackground,_3238.hasBackground ? _3238.backgroundColor : 0);
                     m = new Matrix();
                     m.scale(_3238.scale,_3238.scale);
                     nbmp.draw(bmp,m);
                  }
                  this.saveFile(nbmp);
               }
            }
         }
         catch(e:Error)
         {
            _11110.instance._11204._11132("SaveAnimationSingleFrameTask:run",e);
            fail(ExportController.EXPORT_ERROR_UNKNOW,null);
         }
      }
      
      private function saveFile(param1:BitmapData) : void
      {
         var _loc3_:* = null;
         var _loc4_:ByteArray = null;
         var _loc5_:_1319 = null;
         if(param1 == null)
         {
            this._3683();
            return;
         }
         var _loc2_:String = _3238.ouputPath + _3238.outputFolder;
         _3613.ouputPath = FileUtil.escapePath(_loc2_);
         if(this._13269)
         {
            _loc3_ = _3613.ouputPath + this._3607;
         }
         else if(this._3605 != null)
         {
            _loc3_ = _3613.ouputPath + this._3607 + "_" + this._3605 + "_" + this._3684;
         }
         else
         {
            _loc3_ = _3613.ouputPath + this._3607;
         }
         if(_3238.imageFormat == _720.IMAGES_FORMAT_JPG)
         {
            _loc4_ = param1.encode(new Rectangle(0,0,param1.width,param1.height),new JPEGEncoderOptions(100));
            _loc3_ += ".jpg";
         }
         else
         {
            _loc5_ = new _1319();
            _loc4_ = _loc5_.encode(param1);
            _loc3_ += ".png";
         }
         param1.dispose();
         param1 = null;
         _118.save(_loc3_,_loc4_,true,"",false,this._3682,this._3683);
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

