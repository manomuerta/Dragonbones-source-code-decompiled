package _11260
{
   import _1038._1037;
   import _1045.DropDownList;
   import _127._140;
   import _40._44;
   import egret.utils.tr;
   
   public class _11259 extends _140
   {
      public var _11454:DropDownList;
      
      public var animations:_1037;
      
      public var vo:_44 = null;
      
      public function _11259()
      {
         this._11454 = new DropDownList();
         this.animations = new _1037();
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._11454.percentWidth = 100;
         this._11454.dataProvider = this.animations;
         this._2527.addElementAt(this._11454,this._2527.getElementIndex(this._11290));
         this._2527.removeElement(this._11290);
         this._11289.visible = false;
         this.title = tr("Property.frame.event.animation");
      }
   }
}

