package _40
{
   import _35.HashObject;
   import _73._75;
   
   public class _44 extends HashObject
   {
      public var _1622:_75;
      
      public var value:String;
      
      public var event:_14033;
      
      public function _44(param1:int = 0, param2:Object = null)
      {
         super(param1,param2);
      }
      
      public static function create(param1:_75, param2:String, param3:int = 0, param4:Object = null) : _44
      {
         var _loc5_:_44;
         (_loc5_ = new _44(param3,param4))._1622 = param1;
         _loc5_.value = param2;
         if(_loc5_._1622 == _75.DISPATCH_EVENT)
         {
            _loc5_.event = new _14033();
         }
         return _loc5_;
      }
      
      public function clone() : _44
      {
         var _loc1_:_44 = create(this._1622,this.value);
         if(this.event)
         {
            _loc1_.event = this.event.clone();
         }
         else
         {
            _loc1_.event = null;
         }
         return _loc1_;
      }
   }
}

