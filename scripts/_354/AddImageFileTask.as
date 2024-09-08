package _354
{
   import _1021._1020;
   import _11111._11110;
   import _120._119;
   import _51._50;
   import _51._70;
   import _51._71;
   import _51._79;
   import _97._124;
   import egret.utils.FileUtil;
   import egret.utils.tr;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.utils.ByteArray;
   
   public class AddImageFileTask extends _119
   {
      public static var num:int;
      
      public static const TYPE_CUSTOME:int = 0;
      
      public static const TYPE_RENAME:int = 1;
      
      public static const TYPE_REPLACE:int = 2;
      
      public static const TYPE_ABANDON:int = 3;
      
      public static var type:int = 0;
      
      private var _3254:_71;
      
      private var _3262:String;
      
      private var _3259:ByteArray;
      
      private var _3258:String;
      
      private var _3257:String;
      
      private var _3261:String;
      
      private var _3260:String;
      
      private var _3264:File;
      
      private var _3263:ByteArray;
      
      public function AddImageFileTask(param1:String, param2:ByteArray, param3:_71)
      {
         super();
         this._3254 = param3;
         this._3262 = param1;
         this._3259 = param2;
      }
      
      override public function run() : void
      {
         this._3258 = FileUtil.getFileName(this._3262);
         this._3261 = FileUtil.getExtension(this._3262);
         this._3260 = FileUtil.getDirectory(this._3262);
         this._3257 = _124._1747(this._3258,this._3256);
         if(this._3257 != this._3258)
         {
            this._3264 = new File(this._3262);
            this._3263 = this._3259;
            this.addFile(type);
         }
         else
         {
            this.saveFile();
            complete();
         }
      }
      
      private function _3256(param1:String) : Boolean
      {
         return FileUtil.exists(this._3260 + param1 + "." + this._3261);
      }
      
      private function saveFile() : void
      {
         var file:File = null;
         var fileStream:FileStream = null;
         try
         {
            file = File.documentsDirectory.resolvePath(this._3260 + this._3257 + "." + this._3261);
            fileStream = new FileStream();
            fileStream.open(file,FileMode.WRITE);
            fileStream.writeBytes(this._3259);
            fileStream.close();
         }
         catch(e:Error)
         {
            _11110.instance._11204._11132("AddImageFileTask::saveFile",e);
            fail(tr("Export.error.openFile"),null);
         }
      }
      
      private function addFile(param1:int) : void
      {
         switch(param1)
         {
            case TYPE_CUSTOME:
               this._3253(this.addFile);
               break;
            case TYPE_ABANDON:
               complete();
               break;
            case TYPE_RENAME:
               this._3255();
               this.saveFile();
               complete();
               break;
            case TYPE_REPLACE:
               this._3257 = this._3258;
               this.saveFile();
               complete();
         }
      }
      
      private function _3255() : void
      {
         var _loc1_:_50 = null;
         var _loc2_:_79 = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:_70 = null;
         var _loc8_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = int(this._3254._2126.length);
         while(_loc3_ < _loc4_)
         {
            _loc1_ = this._3254._2126[_loc3_];
            _loc5_ = 0;
            _loc6_ = int(_loc1_._1780.length);
            while(_loc5_ < _loc6_)
            {
               _loc2_ = _loc1_._1780[_loc5_];
               for each(_loc7_ in _loc2_._1765)
               {
                  if(_loc7_.textureName == null)
                  {
                     _loc8_ = _loc7_.path.split("/");
                     if(_loc8_[_loc8_.length - 1] == this._3258)
                     {
                        _loc8_[_loc8_.length - 1] = this._3257;
                        _loc7_.changePath(_loc8_.join("/"));
                     }
                  }
               }
               _loc5_++;
            }
            _loc3_++;
         }
      }
      
      private function _3253(param1:Function) : void
      {
         var _loc2_:_1020 = null;
         if(type == TYPE_CUSTOME)
         {
            --num;
            _loc2_ = new _1020();
            _loc2_.setData(_1020.TYPE_FILE,this._3258 + "." + this._3261,this._3257 + "." + this._3261,this._3260,this._3264,this._3263,num,param1);
            _loc2_.open();
         }
         else
         {
            param1(type);
         }
      }
   }
}

