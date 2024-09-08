package _915
{
   import _1045.Group;
   import _1045._1084;
   import _1374.TextInput;
   import _97._125;
   
   public class _920 extends _1084
   {
      public var _6521:TextInput;
      
      public var _6593:_918;
      
      public function _920()
      {
         super();
      }
      
      override protected function _2438() : void
      {
         var _loc1_:Group = null;
         super._2438();
         _loc1_ = _125._2414();
         _loc1_.left = 6;
         this._6521 = new TextInput();
         this._6521.maxChars = 3;
         this._6521.restrict = "0-9";
         this._6521.width = 40;
         this._6593 = new _918();
         this._6593.value = 100;
         _loc1_.addElement(this._6593);
         _loc1_.addElement(this._6521);
         addElement(_loc1_);
      }
   }
}

