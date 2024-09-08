package _668
{
   import _1374._1393;
   import _93._95;
   import _944._946;
   import egret.utils.tr;
   
   public class _706 extends _95 implements _1393
   {
      public static var _4829:String = "welcome";
      
      public static var instance:_706 = new _706();
      
      protected var _owner:Object;
      
      public function _706()
      {
         super();
      }
      
      public function get label() : String
      {
         return tr("Welcome.Title");
      }
      
      public function get path() : String
      {
         return _4829;
      }
      
      public function get data() : Object
      {
         return null;
      }
      
      public function set data(param1:Object) : void
      {
      }
      
      public function get clazz() : Class
      {
         return _946;
      }
      
      public function get owner() : Object
      {
         return this._owner;
      }
      
      public function set owner(param1:Object) : void
      {
         this._owner = param1;
      }
   }
}

