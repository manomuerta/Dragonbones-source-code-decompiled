package _890
{
   import _1045.Group;
   import _1045._1105;
   import _97._125;
   
   public class _903 extends _892
   {
      private var group:Group;
      
      public var _6493:_1105;
      
      public function _903()
      {
         this.group = _125._2414();
         this._6493 = new _1105();
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._6493 = new _1105();
         this._6493.x = 5;
         this._6493.y = 5;
         this._6493.scaleX = this._6493.scaleY = 0.5;
         this.addElement(this._6493);
         _6487.x = 25;
         _6487.height = 20;
         _6487.verticalCenter = 0;
      }
   }
}

