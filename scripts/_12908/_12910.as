package _12908
{
   import _1045.Button;
   import _11106._11108;
   import _11106._12897;
   import _11111._11110;
   import _1343._839;
   import _97._106;
   import egret.utils.tr;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public class _12910 extends Button
   {
      public function _12910(param1:Object = null, param2:Boolean = false)
      {
         var _loc3_:_839 = null;
         super();
         if(param1)
         {
            this.skinName = param1;
         }
         else
         {
            this.skinName = _839;
         }
         if(param2)
         {
            label = tr("Pay.company.more");
         }
         else
         {
            label = tr("Pay.learn.more");
         }
         this.addEventListener(MouseEvent.CLICK,this._13038);
      }
      
      private function _13038(param1:MouseEvent) : void
      {
         navigateToURL(new URLRequest(_106.local(_106.LEARN_PAID)),"_blank");
         _11110.instance._12948._13259(_12897.LearnPaid,_11108.Unknown);
      }
   }
}

