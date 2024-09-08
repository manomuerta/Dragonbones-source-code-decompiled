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
   
   public class CopyImageFileTask extends _119
   {
      public static const TYPE_CUSTOME:int = 0;
      
      public static const TYPE_RENAME:int = 1;
      
      public static const TYPE_REPLACE:int = 2;
      
      public static const TYPE_ABANDON:int = 3;
      
      public static var type:int = 0;
      
      public static var num:int = 0;
      
      private var _12531:String;
      
      private var _12533:String;
      
      private var _12534:Object;
      
      private var _3258:String;
      
      private var _12526:String;
      
      private var _12528:String;
      
      private var _12529:String;
      
      private var _3257:String;
      
      private var _12527:String;
      
      public function CopyImageFileTask(param1:String, param2:String, param3:Object)
      {
         super();
         this._12531 = param1;
         this._12533 = param2;
         this._12534 = param3;
      }
      
      override public function run() : void
      {
         this._3258 = FileUtil.getFileNameWithSuffix(this._12533);
         this._12526 = FileUtil.getFileName(this._12533);
         this._12528 = FileUtil.getExtension(this._12533);
         this._12529 = this._12533.substr(0,this._12533.length - this._3258.length);
         if(this._12534[this._3258] != null)
         {
            this._12527 = this._12534[this._3258];
            this._3257 = this._12527 + "." + this._12528;
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
            this._12532(this._12533,FileUtil.openAsByteArray(this._12531));
         }
         catch(e:Error)
         {
            _11110.instance._11204._11132("CopyImageFileTask::saveFile",e);
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
      
      private function addFile(param1:int) : void
      {
         switch(param1)
         {
            case TYPE_CUSTOME:
               this._3253(this.addFile);
               break;
            case TYPE_ABANDON:
               this._12530();
               complete();
               break;
            case TYPE_RENAME:
               this._12533 = this._12529 + this._3257;
               this.saveFile();
               complete();
               break;
            case TYPE_REPLACE:
               this._12530();
               this.saveFile();
               complete();
         }
      }
      
      private function _12530() : void
      {
         delete this._12534[this._3258];
         delete this._12534[this._12526];
      }
      
      private function _3253(param1:Function) : void
      {
         var _loc2_:File = null;
         var _loc3_:ByteArray = null;
         var _loc4_:_1020 = null;
         if(type == TYPE_CUSTOME)
         {
            --num;
            _loc2_ = new File(this._12533);
            _loc3_ = FileUtil.openAsByteArray(this._12531);
            _loc4_ = new _1020();
            _loc4_.setData(_1020.TYPE_COPY_IMAGE,this._3258,this._3257,this._12529,_loc2_,_loc3_,num,param1);
            _loc4_.open();
         }
         else
         {
            param1(type);
         }
      }
   }
}

