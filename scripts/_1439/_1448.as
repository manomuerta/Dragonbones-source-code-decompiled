package _1439
{
   import _1045.Group;
   import _1045._1079;
   import _1374.IconList;
   
   public class _1448 extends _1264
   {
      public var popUp:_1079;
      
      public var _8412:Group;
      
      public var _9735:IconList;
      
      public function _1448()
      {
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.popUp = new _1079();
         this.popUp.left = this.popUp.right = this.popUp.top = this.popUp.bottom = 0;
         this.popUp._8219 = "below";
         this.popUp._8202 = true;
         this.addElement(this.popUp);
         this._8412 = new Group();
         this.popUp.popUp = this._8412;
         this._9735 = new IconList();
         this._9735._6678 = true;
         this._9735.maxHeight = 115;
         this._9735.percentWidth = 100;
         this._8412.addElement(this._9735);
      }
      
      override protected function _2519() : void
      {
         super._2519();
      }
   }
}

