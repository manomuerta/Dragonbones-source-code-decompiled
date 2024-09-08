package _217
{
   import _1021._1020;
   import _120._119;
   import _13503._13502;
   import _51._50;
   import _97._124;
   
   public class _11844 extends _119
   {
      public static var num:int;
      
      public static const TYPE_CUSTOME:int = 0;
      
      public static const TYPE_RENAME:int = 1;
      
      public static const TYPE_REPLACE:int = 2;
      
      public static const TYPE_ABANDON:int = 3;
      
      public static var type:int = 0;
      
      private var _2060:_13502;
      
      private var _11963:Vector.<_13502>;
      
      private var _11962:Vector.<_13502>;
      
      private var _11964:_50;
      
      public function _11844(param1:_13502, param2:Vector.<_13502>, param3:Vector.<_13502>, param4:_50)
      {
         super();
         this._2060 = param1;
         this._11963 = param2;
         this._11962 = param3;
         this._11964 = param4;
      }
      
      override public function run() : void
      {
         super.run();
         this._11961(type);
      }
      
      private function _11961(param1:int) : void
      {
         switch(param1)
         {
            case TYPE_CUSTOME:
               this._3253(this._11961);
               break;
            case TYPE_ABANDON:
               complete();
               break;
            case TYPE_RENAME:
               this.rename();
               complete();
               break;
            case TYPE_REPLACE:
               this.replace();
               complete();
         }
      }
      
      private function _3253(param1:Function) : void
      {
         var _loc2_:String = null;
         var _loc3_:_1020 = null;
         if(type == TYPE_CUSTOME)
         {
            --num;
            _loc2_ = this._11965();
            _loc3_ = new _1020();
            _loc3_.setData(_1020.TYPE_ANIMATION,this._2060.name,_loc2_,null,null,null,num,param1);
            _loc3_.open();
         }
         else
         {
            param1(type);
         }
      }
      
      private function replace() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_13502 = this._11964._13656(this._2060.name);
         if(_loc3_)
         {
            if(this._11962.indexOf(_loc3_) == -1)
            {
               this._11962.push(_loc3_);
            }
         }
         _loc1_ = 0;
         _loc2_ = int(this._11963.length);
         while(_loc1_ < _loc2_)
         {
            if(this._11963[_loc1_].name == this._2060.name)
            {
               this._11963.splice(_loc1_,1);
               _loc2_--;
               _loc1_--;
            }
            _loc1_++;
         }
         this._11963.push(this._2060);
      }
      
      private function rename() : void
      {
         var _loc1_:String = this._11965();
         this._2060.name = _loc1_;
         this._11963.push(this._2060);
      }
      
      private function _11965() : String
      {
         return _124._1747(this._2060.name,this._11960);
      }
      
      private function _11960(param1:String) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_13502 = this._11964._13656(param1);
         if(_loc4_)
         {
            return true;
         }
         _loc2_ = 0;
         _loc3_ = int(this._11963.length);
         while(_loc2_ < _loc3_)
         {
            if(this._11963[_loc2_].name == param1)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
   }
}

