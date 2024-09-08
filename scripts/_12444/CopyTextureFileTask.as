package _12444
{
   import _1021._1020;
   import _11111._11110;
   import _120._119;
   import egret.utils.FileUtil;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.utils.ByteArray;
   
   public class CopyTextureFileTask extends _119
   {
      public static const TYPE_CUSTOME:int = 0;
      
      public static const TYPE_RENAME:int = 1;
      
      public static const TYPE_REPLACE:int = 2;
      
      public static const TYPE_ABANDON:int = 3;
      
      public static var type:int = 0;
      
      public static var num:int = 0;
      
      private var _12531:Array;
      
      private var _12533:Array;
      
      private var _12534:Object;
      
      private var _3258:String;
      
      private var _12526:String;
      
      private var _12528:String;
      
      private var _12529:String;
      
      private var _3257:String;
      
      private var _12527:String;
      
      private var _12536:int;
      
      public function CopyTextureFileTask(param1:Array, param2:Array, param3:Object)
      {
         super();
         this._12531 = param1;
         this._12533 = param2;
         this._12534 = param3;
      }
      
      override public function run() : void
      {
         this._3258 = FileUtil.getFileNameWithSuffix(this._12533[0]);
         this._3257 = this._12534[this._3258];
         if(this._3257 != null)
         {
            this._12528 = FileUtil.getExtension(this._12533[0]);
            this._12536 = 0;
            if(this._12528.toLowerCase() == "json")
            {
               this._12536 = 1;
               this._12528 = FileUtil.getExtension(this._12533[1]);
            }
            this._3258 = FileUtil.getFileNameWithSuffix(this._12533[this._12536]);
            this._12526 = FileUtil.getFileName(this._12533[this._12536]);
            this._12529 = this._12533[this._12536].substr(0,this._12533[this._12536].length - this._3258.length);
            this.addFile(type);
         }
         else
         {
            this.saveFile();
            complete();
         }
      }
      
      private function saveFile() : void
      {
         try
         {
            this._12532(this._12533[0],FileUtil.openAsByteArray(this._12531[0]));
            this._12532(this._12533[1],FileUtil.openAsByteArray(this._12531[1]));
         }
         catch(e:Error)
         {
            _11110.instance._11204._11132("CopyTextureFileTask::saveFile",e);
         }
      }
      
      private function _12532(param1:String, param2:ByteArray) : void
      {
         var _loc3_:File = new File(param1);
         var _loc4_:FileStream = new FileStream();
         _loc4_.open(_loc3_,FileMode.WRITE);
         _loc4_.writeBytes(param2);
         _loc4_.close();
      }
      
      private function rename() : void
      {
         var configIndex:int = 0;
         var configContent:ByteArray = null;
         var jsonObj:Object = null;
         var jsonByte:ByteArray = null;
         try
         {
            if(this._12536 == 0)
            {
               this._12533[1] = this._12529 + this._3257 + ".json";
               configIndex = 1;
            }
            else
            {
               this._12533[0] = this._12529 + this._3257 + ".json";
               configIndex = 0;
            }
            this._12533[this._12536] = this._12529 + this._3257 + "." + this._12528;
            configContent = FileUtil.openAsByteArray(this._12531[0]);
            jsonObj = JSON.parse(configContent.readUTFBytes(configContent.length));
            jsonObj.imagePath = this._3257 + "." + this._12528;
            jsonByte = new ByteArray();
            jsonByte.writeUTFBytes(JSON.stringify(jsonObj));
            configContent = jsonByte;
            this._12532(this._12533[this._12536],FileUtil.openAsByteArray(this._12531[this._12536]));
            this._12532(this._12533[configIndex],configContent);
         }
         catch(e:Error)
         {
            _11110.instance._11204._11132("CopyTextureFileTask::saveFile",e);
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
               this._12535();
               complete();
               break;
            case TYPE_RENAME:
               this.rename();
               complete();
               break;
            case TYPE_REPLACE:
               this._12535();
               this.saveFile();
               complete();
         }
      }
      
      private function _12535() : void
      {
         var _loc1_:String = FileUtil.getFileNameWithSuffix(this._12533[0]);
         delete this._12534[_loc1_];
         _loc1_ = FileUtil.getFileNameWithSuffix(this._12533[1]);
         delete this._12534[_loc1_];
      }
      
      private function _3253(param1:Function) : void
      {
         var _loc2_:File = null;
         var _loc3_:ByteArray = null;
         var _loc4_:_1020 = null;
         if(type == TYPE_CUSTOME)
         {
            --num;
            _loc2_ = new File(this._12533[this._12536]);
            _loc3_ = FileUtil.openAsByteArray(this._12531[this._12536]);
            _loc4_ = new _1020();
            _loc4_.setData(_1020.TYPE_COPY_TEXTURE,this._12526,this._3257,this._12529,_loc2_,_loc3_,num,param1);
            _loc4_.open();
         }
         else
         {
            param1(type);
         }
      }
   }
}

