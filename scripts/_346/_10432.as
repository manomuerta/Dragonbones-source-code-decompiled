package _346
{
   import _11106._11108;
   import _11111._11110;
   import _1374.Alert;
   import _1404._1407;
   import _625._627;
   import _772._773;
   import _777._779;
   import _93._92;
   import egret.utils.tr;
   import flash.net.URLVariables;
   
   public class _10432 extends _92
   {
      public function _10432()
      {
         super();
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
      }
      
      override public function execute() : void
      {
         if(Boolean(this.url) && Boolean(this.url.dbdata))
         {
            _779.instance._3276(_779.PARAM_TYPE,_773.TYPE_PHOTOSHOP);
            _779.instance._3276(_779.PARAM_OP,_773.PHOTOSHOP);
            _11110.instance._11131._11130(_11108.Photoshop);
            this._3227._5147(this.url.dbdata);
         }
         else
         {
            Alert.show(tr("ComicPropertyPanel.ComingSoon"));
         }
      }
      
      private function get url() : URLVariables
      {
         return _2223 as URLVariables;
      }
      
      private function get _3227() : _627
      {
         return _1407.getInstance(_627) as _627;
      }
   }
}

