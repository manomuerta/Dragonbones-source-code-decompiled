package _51
{
   import _35.HashObject;
   import _81._90;
   import flash.utils.Dictionary;
   
   public class _78 extends HashObject implements _90
   {
      private var _name:String = "";
      
      public var _1765:Dictionary;
      
      public function _78(param1:int = 0, param2:Object = null)
      {
         this._1765 = new Dictionary();
         super(param1,param2);
      }
      
      public static function _1782(param1:String, param2:int = 0, param3:Object = null) : _78
      {
         var _loc4_:_78;
         (_loc4_ = new _78(param2,param3))._name = param1;
         return _loc4_;
      }
      
      public function _1766(param1:_70) : void
      {
         param1._1985 = this;
         var _loc2_:_79 = param1._1760;
         if(!this._1765[_loc2_])
         {
            this._1765[_loc2_] = new Dictionary();
         }
         var _loc3_:_70 = this._1765[_loc2_][param1._1733];
         if(Boolean(_loc3_) && _loc3_ != param1)
         {
            _loc3_.dispose();
         }
         this._1765[_loc2_][param1._1733] = param1;
      }
      
      public function _1965(param1:_70, param2:Boolean = true) : void
      {
         this._1765[param1._1760][param1._1733] = null;
         delete this._1765[param1._1760][param1._1733];
         if(param2)
         {
            param1.dispose();
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(this._name == param1)
         {
            return;
         }
         this._name = param1;
      }
   }
}

