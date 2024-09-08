package _354
{
   import _1021._1020;
   import _120._119;
   import _1404._1407;
   import _51._50;
   import _51._71;
   import _555.LibraryPanelController;
   import _97._124;
   
   public class _353 extends _119
   {
      public static var num:int;
      
      public static const TYPE_CUSTOME:int = 0;
      
      public static const TYPE_RENAME:int = 1;
      
      public static const TYPE_REPLACE:int = 2;
      
      public static const TYPE_ABANDON:int = 3;
      
      public static var type:int = 0;
      
      private var _3247:_71;
      
      private var _3245:_71;
      
      private var _3251:_50;
      
      private var _3250:String;
      
      private var _3249:String;
      
      private var _10295:Vector.<_50>;
      
      private var _10293:Vector.<String>;
      
      public function _353(param1:_71, param2:_71, param3:_50, param4:String, param5:Vector.<_50>, param6:Vector.<String>)
      {
         super();
         this._3247 = param1;
         this._3245 = param2;
         this._3251 = param3;
         this._3250 = param4;
         this._10295 = param5;
         this._10293 = param6;
      }
      
      override public function run() : void
      {
         this._3249 = _124._1747(this._3251.name,this._3248);
         if(this._3249 != this._3251.name)
         {
            this._3249 = _124._1747(this._3249,this._3244);
            this._3252(type);
         }
         else
         {
            this._10295.push(this._3251);
            this._10293.push(this._3250);
            complete();
         }
      }
      
      private function _3244(param1:String) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._3245._2126.length);
         while(_loc2_ < _loc3_)
         {
            if(this._3245._2126[_loc2_].name == param1)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      private function _3248(param1:String) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._3247._2126.length);
         while(_loc2_ < _loc3_)
         {
            if(this._3247._2126[_loc2_].name == param1)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      private function _3252(param1:int) : void
      {
         switch(param1)
         {
            case TYPE_CUSTOME:
               this._3253(this._3252);
               break;
            case TYPE_ABANDON:
               complete();
               break;
            case TYPE_RENAME:
               this._3251.name = this._3249;
               this._10295.push(this._3251);
               this._10293.push(this._3250);
               complete();
               break;
            case TYPE_REPLACE:
               this._10295.push(this._3251);
               this._10293.push(this._3250);
               complete();
         }
      }
      
      private function _3253(param1:Function) : void
      {
         var _loc2_:_1020 = null;
         if(type == TYPE_CUSTOME)
         {
            --num;
            _loc2_ = new _1020();
            _loc2_.setData(_1020.TYPE_ARMATURE,this._3251.name,this._3249,null,null,null,num,param1);
            _loc2_.open();
         }
         else
         {
            param1(type);
         }
      }
      
      private function get _2861() : LibraryPanelController
      {
         return _1407.getInstance(LibraryPanelController) as LibraryPanelController;
      }
   }
}

