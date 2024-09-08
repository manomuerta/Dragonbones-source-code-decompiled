package _822
{
   import _1075.MenuItemRenderer;
   import egret.utils.tr;
   
   public class _12899 extends MenuItemRenderer
   {
      public function _12899()
      {
         super();
      }
      
      public function _13029() : Boolean
      {
         var _loc2_:* = undefined;
         var _loc1_:Object = this.data;
         if(_loc1_ is XML)
         {
            _loc2_ = _loc1_.@limited;
            if(_loc2_[0] == true)
            {
               return true;
            }
         }
         else if(_loc1_ is Object)
         {
            try
            {
               return "true" != String(_loc1_.enabled);
            }
            catch(e:Error)
            {
            }
         }
         return false;
      }
      
      override protected function _2476() : void
      {
         super._2476();
         if(this._13029())
         {
            this.toolTip = tr("Pay.fun.limit");
         }
         else
         {
            this.toolTip = null;
         }
      }
      
      override protected function _6231() : String
      {
         var _loc1_:String = null;
         if(selected)
         {
            _loc1_ = "down";
         }
         else
         {
            _loc1_ = super._6231();
         }
         if(this._13029())
         {
            _loc1_ = "limited_" + _loc1_;
         }
         return _loc1_;
      }
   }
}

