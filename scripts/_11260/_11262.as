package _11260
{
   import _127._140;
   import _1374.TextInput;
   import _40._44;
   import egret.utils.tr;
   
   public class _11262 extends _140
   {
      public var _11343:TextInput;
      
      public var vo:_44 = null;
      
      public function _11262()
      {
         this._11343 = new TextInput();
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._11343.percentWidth = 100;
         this._2527.addElementAt(this._11343,this._2527.getElementIndex(this._11290));
         this._2527.removeElement(this._11290);
         this._11289.visible = false;
         this.title = tr("Property.frame.event.sound");
      }
   }
}

