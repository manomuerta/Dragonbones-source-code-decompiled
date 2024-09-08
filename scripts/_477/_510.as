package _477
{
   import flash.filesystem.File;
   import flash.utils.ByteArray;
   import zero.zip.Zip;
   
   public class _510 extends _494
   {
      public function _510()
      {
         super();
      }
      
      override public function run() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = undefined;
         var _loc6_:String = null;
         var _loc9_:ByteArray = null;
         var _loc1_:Zip = new Zip();
         var _loc2_:Date = new Date();
         _loc3_ = 0;
         _loc4_ = int(_3613._3676.length);
         while(_loc3_ < _loc4_)
         {
            _loc6_ = _3613._3676[_loc3_].path;
            _loc5_ = _3613._3676[_loc3_].data;
            if(_loc6_.indexOf(_3613.ouputPath) != -1)
            {
               _loc6_ = _loc6_.substr(_3613.ouputPath.length);
            }
            if(_loc5_ is ByteArray)
            {
               _loc1_.add(_loc5_,_loc6_,_loc2_);
            }
            else
            {
               _loc9_ = new ByteArray();
               if(_loc5_ is String || _loc5_ is XML)
               {
                  _loc9_.writeUTFBytes(_loc5_);
               }
               else
               {
                  _loc9_.writeObject(_loc5_);
               }
               _loc1_.add(_loc9_,_loc6_,_loc2_);
            }
            _loc3_++;
         }
         var _loc7_:* = _3613.ouputPath + _3238.outputName + ".zip";
         var _loc8_:File = File.documentsDirectory.resolvePath(_loc7_);
         _3613._3676.length = 0;
         _3613._3676.push({
            "path":_loc8_.nativePath,
            "data":_loc1_.encode()
         });
         complete();
      }
   }
}

