package _477
{
   import _1315._1319;
   import _721._720;
   import egret.utils.FileUtil;
   import flash.display.BitmapData;
   import flash.display.JPEGEncoderOptions;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   
   public class _493 extends _494
   {
      public function _493()
      {
         super();
      }
      
      override public function run() : void
      {
         var _loc4_:Vector.<BitmapData> = null;
         var _loc7_:Boolean = false;
         var _loc1_:int = 0;
         var _loc2_:String = _3238.ouputPath + _3238.outputFolder;
         _3613.ouputPath = FileUtil.escapePath(_loc2_);
         var _loc3_:int = int(_3613._3609._3705.length);
         if(Boolean(_3613._3609._3690) && _3613._3609._3690.length > 0)
         {
            _loc4_ = _3613._3609._3690;
         }
         else
         {
            _loc4_ = _3613._3609._3691;
         }
         var _loc5_:int = int(_loc4_.length);
         var _loc6_:* = _3238.curArmature + "_tex";
         if(_loc3_ > 0 && _loc5_ > 0)
         {
            _loc7_ = _loc3_ > 1 && _loc5_ > 1;
            _loc1_ = 0;
            while(_loc1_ < _loc3_)
            {
               this._3704(_loc7_ ? _loc6_ + "_" + _loc1_ : _loc6_,_3613._3609._3705[_loc1_],_loc4_[_loc1_]);
               _loc1_++;
            }
         }
         complete();
      }
      
      private function _3704(param1:String, param2:Array, param3:BitmapData) : void
      {
         var _loc6_:_1319 = null;
         var _loc4_:Object;
         (_loc4_ = {}).name = _3238.outputName + "_tex";
         if(_3238.imageFormat == _720.IMAGES_FORMAT_JPG)
         {
            _loc4_.imagePath = param1 + ".jpg";
         }
         else
         {
            _loc4_.imagePath = param1 + ".png";
         }
         _loc4_.SubTexture = param2;
         var _loc5_:ByteArray = new ByteArray();
         if(param3)
         {
            if(_3238.imageFormat == _720.IMAGES_FORMAT_JPG)
            {
               _loc5_ = param3.encode(new Rectangle(0,0,param3.width,param3.height),new JPEGEncoderOptions(100));
               _3613._3676.push({
                  "path":_3613.ouputPath + param1 + ".jpg",
                  "data":_loc5_
               });
            }
            else
            {
               _loc6_ = new _1319();
               _loc5_ = _loc6_.encode(param3);
               _3613._3676.push({
                  "path":_3613.ouputPath + param1 + ".png",
                  "data":_loc5_
               });
            }
            _3613._3676.push({
               "path":_3613.ouputPath + param1 + ".json",
               "data":JSON.stringify(_loc4_)
            });
         }
      }
   }
}

