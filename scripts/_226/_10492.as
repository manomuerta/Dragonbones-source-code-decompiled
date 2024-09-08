package _226
{
   import _1404._1407;
   import _51._70;
   import _51._79;
   import _555.LibraryPanelController;
   import _555._570;
   import _555._571;
   import _555._576;
   import _561._568;
   import _586._589;
   import _586._594;
   import _724._725;
   import _73.SymbolType;
   import _93._92;
   
   public class _10492 extends _92
   {
      public function _10492()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._10498(this._10499);
      }
      
      override public function revert() : void
      {
         this._10498(this._10500);
      }
      
      protected function _10498(param1:_725) : void
      {
         this.displayVO._2104 = param1;
         this.displayVO.changePath(param1.path);
         if(this._1837)
         {
            if(_2214 && _2214._1844 && _2214._1844._2871 && Boolean(_2214._1844._2871._2865))
            {
               if(_2214._1844._2871._2865._1811 == SymbolType.COMIC)
               {
                  this._3058._10497(this._1837);
               }
               else
               {
                  _2212._2907(this._1837);
                  this._2853.refresh(this._1837);
                  this._2880._2891();
                  if(this._1837._2165)
                  {
                     this._3008.refresh(this._1837);
                     this._4216.refresh();
                  }
               }
            }
         }
         this._2861.refreshItemNum();
      }
      
      protected function get _1837() : _79
      {
         return _2223._1837 as _79;
      }
      
      protected function get displayVO() : _70
      {
         return _2223.displayVO as _70;
      }
      
      protected function get _10500() : _725
      {
         return _2223._10500 as _725;
      }
      
      protected function get _10499() : _725
      {
         return _2223._10499 as _725;
      }
      
      protected function get _2880() : _571
      {
         return _1407.getInstance(_571) as _571;
      }
      
      protected function get _3009() : _576
      {
         return _1407.getInstance(_576) as _576;
      }
      
      protected function get _2853() : _570
      {
         return _1407.getInstance(_570) as _570;
      }
      
      protected function get _3008() : _594
      {
         return _1407.getInstance(_594) as _594;
      }
      
      protected function get _4216() : _568
      {
         return _1407.getInstance(_568) as _568;
      }
      
      private function get _3058() : _589
      {
         return _1407.getInstance(_589) as _589;
      }
      
      private function get _2861() : LibraryPanelController
      {
         return _1407.getInstance(LibraryPanelController) as LibraryPanelController;
      }
   }
}

