package _1049
{
   import _1225._840;
   import egret.core._1118;
   
   public class _1052 extends _1056
   {
      public var _2577:_1118;
      
      public function _1052()
      {
         super();
         this.skinName = _840;
      }
      
      override public function get value() : Object
      {
         return this._2577.text;
      }
      
      override public function set value(param1:Object) : void
      {
         this._2577.text = param1 != null ? param1.toString() : "";
         this._2577._2581();
         this._2577.selectAll();
      }
   }
}

