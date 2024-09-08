package _890
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1105;
   import _97._125;
   
   public class _898 extends _892
   {
      private var group:Group;
      
      public var _6491:Label;
      
      public var _6493:_1105;
      
      public function _898()
      {
         this.group = _125._2414();
         this._6491 = new Label();
         this._6493 = new _1105();
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._6493 = new _1105();
         this._6493.x = 5;
         this._6493.y = 9;
         this.addElement(this._6493);
         _6487.x = 45;
         _6487.y = 8;
         _6487.height = 20;
         this.addElement(this._6491);
         this._6491.x = 45;
         this._6491.y = 25;
         this._6491.alpha = 0.5;
         this._6491.percentWidth = 100;
         this._6491.height = 20;
      }
   }
}

