package _890
{
   import _1045.Group;
   import _1045._1082;
   
   public class _889 extends Group
   {
      private var _6485:_1082;
      
      public function _889()
      {
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._6485 = new _1082();
         this._6485.fillColor = 7208806;
         this._6485._2529 = 0.2;
         this._6485.top = this._6485.left = -1;
         this._6485.bottom = this._6485.right = -1;
         this.addElement(this._6485);
         this._6485.visible = false;
      }
      
      public function _6083(param1:Boolean) : void
      {
         if(param1 == 1)
         {
            this._6485.visible = false;
         }
         else
         {
            this._6485.visible = true;
         }
      }
   }
}

