package _915
{
   import _1045.Label;
   import _1045._1082;
   import _1049._1057;
   
   public class _916 extends _1049._1057
   {
      public var _4444:Label;
      
      public var _6594:_1082;
      
      public function _916()
      {
         super();
         this.skinName = _917;
      }
      
      override protected function _2438() : void
      {
         super._2438();
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(param1)
         {
            this._4444.text = param1.bone.name;
            this._6594.fillColor = param1.color;
         }
      }
   }
}

